#!/bin/bash

if [ -z "$1" ]; then
echo "[*] strips ips depended on services"
echo "[*] Usage:	$0 <gnmap file>"
exit0
fi

gnmap $1 | awk -F ',' '{ print $6 }' | sort -u | tee service-list.txt

for s in $(cat service-list.txt);do
	gnmap $1 | grep $s | awk -F ',' '{ print $1 "|" $2 }' | sort -u | tee -a $s-hosts

done