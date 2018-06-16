#!/usr/bin/env bash
# preprocessing
INPUT_DIR=./input
OUTPUT_DIR=./output

INPUT_FILE="${INPUT_DIR}/2018-06-15RUNconsolidated.csv"
OUTPUT_FILE="${OUTPUT_DIR}/2018-06-15pre.txt"

HLADB_VERSION=3290

set -x
python run/pre.py ${INPUT_FILE} ${OUTPUT_FILE} --hladb_version 3290

