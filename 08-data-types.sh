#!/bin/bash

NUMBER1=100
NUMBER2=200

SUM=$(($NUMBER1+$NUMBER2))

echo "SUM is: ${SUM}"


LEADERS=("MODI","SATYA","MADHU","NAGARAJU ABVP")
echo "All leaders: ${LEADERS[@]}"
echo "All leaders: ${LEADERS[0]}"
echo "All leaders: ${LEADERS[10]}"
echo "All leaders: ${LEADERS[3]}"