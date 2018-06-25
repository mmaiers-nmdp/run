#!/usr/bin/env bash
# preprocessing
INPUT_DIR=./input
OUTPUT_DIR=./output

INPUT_FILE="${INPUT_DIR}/global.2018-06-20.csv"
OUTPUT_FILE="${OUTPUT_DIR}/global.2018-06-20.pre.txt"

HLADB_VERSION=3320

python run/pre.py ${INPUT_FILE} --hladb_version ${HLADB_VERSION} > ${OUTPUT_FILE}

