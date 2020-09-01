#!/bin/bash

echo "{"
echo "  \"data\":"
echo "    ["
nvidia-smi --query-gpu=index --format=csv | grep '^[0-9]' | while read line; do
echo "      {\"{#LOCALGPU}\":\"$line\"},"
done | sed '$s/,$//g'
echo "    ]"
echo "}"
