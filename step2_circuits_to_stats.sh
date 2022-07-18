#!/bin/bash

set -e

CIRCUIT_DIR=$1
OUT_CSV=$2
PROCESSES=$3
DECODER=$4

if [ -z "${CIRCUIT_DIR}" ]; then
  echo "First arg must be the circuits directory."
  exit 1
fi
if [ -z "${OUT_CSV}" ]; then
  echo "Second arg must be save-resume CSV file path to output to."
  exit 1
fi
if [ -z "${PROCESSES}" ]; then
  echo "Third arg must be number of worker processes to use."
  exit 1
fi
if [ -z "${DECODER}" ]; then
  echo "Fourth arg must be decoder to use."
  exit 1
fi

sinter collect \
    --circuits "${CIRCUIT_DIR}"/*.stim \
    --metadata_func "sinter.comma_separated_key_values(path)" \
    --decoders "${DECODER}" \
    --max_shots 100_000_000 \
    --max_errors 1000 \
    --save_resume_filepath "${OUT_CSV}" \
    --processes "${PROCESSES}"
