#!/bin/bash

set -eu # stop on error

for i in {1..384}; do

 sort -k1,1n -k2,2n < "$i" > "$i.new" && mv "$i.new" "$i"

done
