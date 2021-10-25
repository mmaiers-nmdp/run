#!/usr/bin/env bash
# preprocessing

RUNDATE=2021-06-28
INPUT_DIR=./input
OUTPUT_DIR=./output

INPUT_FILE="${INPUT_DIR}/global.${RUNDATE}.csv"
OUTPUT_FILE="${OUTPUT_DIR}/global.${RUNDATE}.pre.txt"
#INPUT_FILE="${INPUT_DIR}/us.match.${RUNDATE}.csv"
#OUTPUT_FILE="${OUTPUT_DIR}/us.match.${RUNDATE}.pre.txt"

#INPUT_FILE="${INPUT_DIR}/global.${RUNDATE}.fix.csv"
#OUTPUT_FILE="${OUTPUT_DIR}/global.${RUNDATE}.fix.txt"

#INPUT_FILE="${INPUT_DIR}/t2.txt"
#OUTPUT_FILE="${OUTPUT_DIR}/global.${RUNDATE}.fix.txt"

HLADB_VERSION=3450

python run/pre.py ${INPUT_FILE} --hladb_version ${HLADB_VERSION} > ${OUTPUT_FILE}

