#!/bin/bash

# Put submitted file back to "submitted/" dir
git mv processed/PR-76/gtex_v7_ciseqtl_brain_hypothalamus.yaml submitted/
git ci -m "clean"
git push

# Remove intermediate file
rm -f processed/s3_list.txt
