#!/bin/bash

set -eu # stop on error

for i in {1..384}; do
 
   cut -f1-6 < "$i" > "$i.new" && mv "$i.new" "$i"

done
