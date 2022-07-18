#!/bin/bash

set -e

readonly IN_CSV=$1
readonly OUT_DIR=$2

if [ -z "${IN_CSV}" ]; then
  echo "First arg must be input stats csv file path."
  exit 1
fi
if [ -z "${OUT_DIR}" ]; then
  echo "Second arg must be output directory for plot images."
  exit 1
fi

PYTHONPATH=src python3 src/stability_paper/scripts/plot_heat_map.py \
    --csv "${IN_CSV}" \
    --save "${OUT_DIR}/heat_map.png"


PYTHONPATH=src python3 src/stability_paper/scripts/plot_error_rate.py \
    --csv "${IN_CSV}" \
    --save "${OUT_DIR}/error_rate.png"
