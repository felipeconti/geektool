#!/bin/sh
echo ——————Top Processes:—————— && ps -arcwwwxo "command %cpu %mem" | head -6
