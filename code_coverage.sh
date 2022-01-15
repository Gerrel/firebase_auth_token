#!/bin/bash

DEST=./coverage

rm -rf ${DEST}
mkdir -p ${DEST}
dart test --coverage="${DEST}"

dart pub global activate coverage
format_coverage --lcov --in=${DEST} --out=${DEST}/coverage.lcov --packages=.packages --report-on=lib
genhtml ${DEST}/coverage.lcov -o ${DEST}/html
open ${DEST}/html