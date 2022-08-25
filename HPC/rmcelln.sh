#!/bin/bash

set -eu # stop on error

for i in {1..384}; do
 
   cut -f1-7 < "$i" > "$i.new" && mv "$i.new" "$i"

done
