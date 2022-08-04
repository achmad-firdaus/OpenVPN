#!/bin/sh
# Usage: sh c_uspw.sh "username" "password" "stat value YES/NO use statik IP"

username=$1
password=$2
stat_statik=$3
stat_statik_YES="YES"

echo "$username"
echo "$password"
echo "$stat_statik"

if [ $stat_statik == $stat_statik_YES ]
#if [$stat_statik=='YES']
then
  echo "Statik IP"
else
  echo "Dynamic IP"
fi
