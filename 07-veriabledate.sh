#!/bin/bash

DATE=$(date)

START_TIME=$(date +%s)

sleep 10 &

END_TIME=$(date +%s)

ELAPSED_TIME=$(( END_TIME - START_TIME ))

echo " script started in :$ELAPSED_TIME seconds"
