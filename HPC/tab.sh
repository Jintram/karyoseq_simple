#!/bin/bash

set -eu # stop on error

for i in {1..384}; do
 
   tr ' ' '\t'  < "$i" > "$i.new" && mv "$i.new" "$i"

done
