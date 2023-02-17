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
# shaing the the date since the epice 
PASSWORD=$(date +%s | sha256sum)
echo "${PASSWORD}"
# to print first 32 character 
PASSWORD=$(date +%s | sha256sum | head -c32)
echo "${PASSWORD}"
# to create an even better password with a length of 48 character 
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48) 
echo "${PASSWORD}"

