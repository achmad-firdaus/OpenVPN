#!/bin/sh
# 
# Create By Achmad
# Date: 04 August 2022
# Note:
# Usage for create user: bash ./c_uspw.sh YES {username} {password} StatikIP:{YES/NO} IPaddress:EX{172.16.1.200}
# Usage for delete user:

YES='YES'

create=$1

if [ $create == $YES ]
then
  echo "Create New User";
  
  #variable create
  username=$2
  password=$3
  stat_statik=$4
  stat_statik_IP=$5

  # Add User:
  sacli --user $username --key "type" --value "user_connect" UserPropPut
  
  # Password:
  sacli --user $username --new_pass "$password" SetLocalPassword
  
  # CheckList Allow Auto-login:
  sacli --user $username --key "prop_autologin" --value "true" UserPropPut

  if [ $stat_statik == $YES ]
  then
    echo "Use Statik IP";
    sacli --user $username --key "conn_ip" --value "$stat_statik_IP" UserPropPut
  else
    echo "Use Dynamic IP";
  fi

else
  echo "Use Dynamic IP";
fi

sacli start

