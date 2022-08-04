#!/bin/sh
# Usage: bash ./c_uspw.sh "username" "password" "stat value YES/NO use statik IP"

username=$1
password=$2
stat_statik=$3
stat_statik_YES='YES'

echo $username;
echo $password;

# Add User:
sacli --user $username --key "type" --value "user_connect" UserPropPut
# Password:
sacli --user $username --new_pass "$password" SetLocalPassword
# CheckList Allow Auto-login:
sacli --user $username --key "prop_autologin" --value "true" UserPropPut

if [ $stat_statik == $stat_statik_YES ]
then
  echo "Use Statik IP";
else
  echo "Use Dynamic IP";
fi
