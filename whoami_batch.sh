#!/bin/bash
while true; do
  sudo > textfile_collector/whoami.prom  # ファイルを初期化
  who | awk '{print "whoami_info{user=\"" $1 "\"} 1"}' | sudo tee -a textfile_collector/whoami.prom
  sleep 15
done