#!/bin/bash 
# this is a shell script to genereate a rando shell script. 
PASSWORD=${RANDOM}
echo "${PASSWORD}"
# Three password together here passwords are concatinated together.
PASSWORD=${RANDOM}${RANDOM}${RANDOM}
echo "${PASSWORD}"
# generate a password based on date and time. 
PASSWORD=$(date +%s)
echo "${PASSWORD}"
# including nanosecon at the time of password creation
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"
