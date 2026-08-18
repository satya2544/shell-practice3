#!/bin/bash

count=5

echo "Starting countdown.."

while [ $count -gt 0 ]
do
  echo "Time left: $count"
  sleep 1 
  count=$((count - 1))


done

echo "Times up!"