#!/usr/bin/env bash
OUT=./textfile_collector/gpu.prom

# メトリクス ヘッダー
{
  echo "# HELP gpu_utilization_percent GPU 利用率 (%)"
  echo "# TYPE gpu_utilization_percent gauge"
} > "$OUT"

# GPU 利用率を取得し Prometheus フォーマットで出力
nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | \
  nl -w1 -s' ' | \
  while read IDX UTIL; do
    # GPU インデックスは0ベースに調整
    IDX0=$((IDX-1))
    echo "gpu_utilization_percent{index=\"${IDX0}\"} ${UTIL}"
  done >> "$OUT"

# 例: 温度やメモリ使用率も欲しい場合は --query-gpu=temperature.gpu,memory.used,memory.total などで追加可能