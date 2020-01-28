#!/bin/bash

nvidia-smi --query-gpu=utilization.gpu,utilization.memory --format=csv,noheader,nounits | awk -F ","  '{gsub(/ /, "", $0); print $1"% Mem "$2"%"} '