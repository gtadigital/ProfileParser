#!/bin/bash
for f in *.xml; do
  mv "$f" $RANDOM-"$f"
done