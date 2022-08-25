#!/bin/bash

set -eu # stop on error

for i in {1..384}; do

 awk -F"\t" '!seen[$1, $2, $3, $7]++' < "$i" > "$i.new" && mv "$i.new" "$i"

done
