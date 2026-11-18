#!/usr/bin/env bash
set -euo pipefail

export CUDA_VISIBLE_DEVICES="${CUDA_VISIBLE_DEVICES:-0}"
echo "Using GPU: $CUDA_VISIBLE_DEVICES"
PAIR_DATA_PATH="${PAIR_DATA_PATH:-release_data_dir/oas_pair_human_data}"
CONFIG_PATH="${CONFIG_PATH:-configs/antibody_pretrain_reproduce.yml}"
LOG_PATH="${LOG_PATH:-tmp/antibody_pretrain_log}"
DATA_VERSION="${DATA_VERSION:-filter}"
python antibody_scripts/antibody_train.py \
--pair_data_path "$PAIR_DATA_PATH" \
--config_path "$CONFIG_PATH" \
--log_path "$LOG_PATH" \
--data_version "$DATA_VERSION"
