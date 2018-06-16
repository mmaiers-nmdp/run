#!/usr/bin/env bash
# preprocessing
INPUT_DIR=./input
OUPUT_DIR=./input

INPUT_FILE="${INPUT_DIR}/2018-06-15 RUN consolidated.csv"
OUTPUTFILE="${OUTPUT_DIR}/2018-06-15pre.txt"


python pre.py -i ${INPUT_FILE} -o ${OUTPUT_FILE}

