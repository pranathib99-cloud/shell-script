#!/bin/bash

DATE=$(date)

START_TIME=$(date +%s)

sleep 10 # sleep for 10 seconds   #  & IS USED FOR BACKGROUND PROCESS # 

END_TIME=$(date +%s)

ELAPSED_TIME=$(( END_TIME - START_TIME ))

echo " script started in :$ELAPSED_TIME seconds"
