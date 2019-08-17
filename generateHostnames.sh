#!/bin/bash

# Define the network range
supernet=${supernet:-192.168}
netMin=${netMin:-122}
netMax=${netMax:-125}
hostMin=${hostMin:-130}
hostMax=${hostMax:-251}

# Iterate and print
wordlist=${wordlist:-'words.txt'}
words=( `printf "%s%s " $(shuf $wordlist)` );
let "z=0";
for ((i=$netMin; i<$netMax; i++)); do
  for ((y=$hostMin; y<$hostMax; y++)); do
    printf "%s %s\n" "$supernet.$i.$y" "${words[$z]}";
    let "z++";
  done;
done;