#!/bin/bash
OUT=/textfile/who.prom
echo "# HELP node_logged_in_user Logged-in users" > $OUT
echo "# TYPE node_logged_in_user gauge" >> $OUT

who -uH | awk 'NR>1 {print $1}' | sort -u | while read user; do
  echo "node_logged_in_user{user=\"$user\"} 1" >> $OUT
done
