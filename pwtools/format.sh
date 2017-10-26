#!/bin/sh
echo
echo "Date          :  $(date)"
/pwtools/gen_pass.sh 2>&1 | paste /pwtools/rows.txt  - | column -s $'\t' -t
echo