#!/bin/bash

# Define the network range
subnet=${subnet:-192.168}
netwMin=${netwMin:-122}
netwMax=${netWMax:-125}
hostMin=${hostMin:-130}
hostMax=${hostMax:-251}

# Iterate and print
wordlist=${wordlist:-'words.txt'}
words=( `printf "%s%s " $(shuf $wordlist)` );
let "z=0";
for ((i=$netwMin; i<$netwMax; i++)); do
  for ((y=$hostMin; y<$hostMax; y++)); do
    printf "%s %s\n" "$subnet.$i.$y" "${words[$z]}";
    let "z++";
  done;
done;
