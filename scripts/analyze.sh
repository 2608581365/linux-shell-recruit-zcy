#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 FILE"
    exit 1
fi

FILE=$1

if [[ ! -f "$FILE" ]]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

ERROR_COUNT=$(grep -c "ERROR" "$FILE")
TOP_CODE=$(grep "ERROR" "$FILE" | grep -o "code=[0-9]*" | sort | uniq -c | sort -nr | head -n 1 | tr -s ' ' | cut -d ' ' -f 3 | cut -d '=' -f 2)
echo "Total ERROR: $ERROR_COUNT"
echo "Top Code: $TOP_CODE"
exit 0