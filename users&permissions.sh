#!/bin/bash


delimiter="\t"


echo "User${delimiter}Permission"

while read line; do
 
  username=$(echo $line | cut -d: -f1)

  uid=$(echo $line | cut -d: -f3)
  gid=$(echo $line | cut -d: -f4)

 
  if [ $uid -eq 0 ]; then
    permission="Root"
  else
    permission="Regular"
  fi

 
  echo "${username}${delimiter}${permission}"
done < /etc/passwd
