#!/bin/bash

set -e

CIRCUIT_DIR=$1

if [ -z "${CIRCUIT_DIR}" ]; then
  echo "First arg must be output directory for circuits."
  exit 1
fi

PYTHONPATH=src python3 src/stability_paper/scripts/generate_circuit_files.py \
     --bases Z \
     --measure_noise 0.001 0.005 0.0075 0.01 0.015 0.02 0.025 0.03 \
     --data_noise 0.001 0.005 0.0075 0.01 0.015 0.02 0.025 0.03 \
     --rounds 5 15 25 \
     --diams 2 4 6 \
     --type stability \
     --out_dir "${CIRCUIT_DIR}"

PYTHONPATH=src python3 src/stability_paper/scripts/generate_circuit_files.py \
     --bases Z \
     --measure_noise 0.001 0.005 0.0075 0.01 0.015 0.02 0.025 0.03 \
     --data_noise 0.001 0.005 0.0075 0.01 0.015 0.02 0.025 0.03 \
     --rounds 2 5 10 \
     --diams 3 5 7 \
     --type memory \
     --out_dir "${CIRCUIT_DIR}"
