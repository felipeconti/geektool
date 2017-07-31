#!/bin/bash

echo ——————Memory:——————

MEM=`top -l 1 | grep PhysMem`

echo $MEM
