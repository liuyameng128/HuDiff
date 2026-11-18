#!/usr/bin/env bash
set -euo pipefail

export CUDA_VISIBLE_DEVICES="${CUDA_VISIBLE_DEVICES:-0}"
echo "Using GPU: $CUDA_VISIBLE_DEVICES"
PAIR_DATA_PATH="${PAIR_DATA_PATH:-release_data_dir/oas_pair_mouse_data}"
CONFIG_PATH="${CONFIG_PATH:-configs/antibody_finetune_reproduce.yml}"
LOG_PATH="${LOG_PATH:-tmp/antibody_finetune_log}"
CKPT_PATH="${CKPT_PATH:-tmp/antibody_pretrain_log/best_model.pt}"
DATA_VERSION="${DATA_VERSION:-filter}"
CONSIDER_MOUSE="${CONSIDER_MOUSE:-True}"

if [[ ! -f "$CKPT_PATH" ]]; then
    echo "Pretrained checkpoint not found: $CKPT_PATH" >&2
    echo "Run antibody_scripts/antibody_run.sh first, or set CKPT_PATH explicitly." >&2
    exit 1
fi

python antibody_scripts/antibody_finetune.py \
--pair_mouse_data_path "$PAIR_DATA_PATH" \
--config_path "$CONFIG_PATH" \
--log_path "$LOG_PATH" \
--ckpt_path "$CKPT_PATH" \
--data_version "$DATA_VERSION" \
--consider_mouse "$CONSIDER_MOUSE"
