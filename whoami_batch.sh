#!/bin/bash
while true; do
  echo "whoami_info{user=\"$(whoami)\"} 1" > textfile_collector/whoami.prom
  sleep 15
done
