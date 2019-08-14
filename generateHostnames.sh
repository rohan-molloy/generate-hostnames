#!/bin/bash
# File containing list of words (seperated by NL)
wordList=${1:-'words.txt'}
# Define the network range printed
subnet='192.168'
netwMin=0
netwMax=2
hostMin=2
hostMax=250
# Iterate and print
readarray words < <(printf "%s%s\n" $(shuf $wordList))
let "z=0"; 
for ((i=$netwMin; i<$netwMax; i++)); do   
  for ((y=$hostMin; y<$hostMax; y++)); do
   printf "%s\t%s" "$subnet.$i.$y" "${words[$z]}";    
   let "z++"; 
   done; 
done;
