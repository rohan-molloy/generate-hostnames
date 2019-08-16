# generate-hostnames

This is a bash script to generate memorable names for an IP address space. The output is in the style of `/etc/hosts`

```
wordlist=${wordlist:-'words.txt'}
words=( `printf "%s%s " $(shuf $wordlist)` );
let "z=0";
for ((i=$netMin; i<$netMax; i++)); do
  for ((y=$hostMin; y<$hostMax; y++)); do
    printf "%s %s\n" "$supernet.$i.$y" "${words[$z]}";
    let "z++";
  done;
done;
```

The names are camelCase word pairs obtained by shuffling a list of the thousand most common English words. This produces readable and memorable hostnames 
such as  `InterestingCitizen` or `PreventPolitics` (see output.txt) 

Often, the word pairs are semi-meaningful and it can be fun to play around with. I have sanitized obvious NSFW entries from
the dictionary of top 100 words.

#### Download dictionary:
>https://www.ef.co.nz/english-resources/english-vocabulary/top-1000-words/

#### Check out my website:
> https://etherarp.net


## Use cases

- Container/Virtualization Network
- Guest/BYOD DHCP
- Naming things is too hard 

## Modifying the network ranges

Set the following environment variables

``` 
export supernet='192.168'; 
export netMin=122;
export netMax=125;
export hostMin=130;
export hostMax=251;
```

## Use with unbound DNS

Use the below script to convert your hosts file into local data entries for Unbound DNS 

```
awk '{print "local-data:\t\""$2".lan. A "$1"\"\nlocal-data-ptr:\t\""$1" "$2".lan\""}' output.txt
```

## Use with Dnsmasq 

Dnsmasq supports standard hosts files Append `hostsdir=/path/to/dir` 
to your `dnsmasq.conf` file then put your generated hostsfile in that directory. 
Dnsmasq will notice changes without needing to restart the daemon 


