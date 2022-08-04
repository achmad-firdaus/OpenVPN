#!/bin/sh
# Usage: bash ./c_uspw.sh "username" "password" "stat value YES/NO use statik IP"

YES='YES'

create=$1

if [ $create == $YES ]
then
  echo "Create New User";
  
  #variable create
  username=$2
  password=$3
  stat_statik=$4
  stat_statik_subnets=$5

  # Add User:
  sacli --user $username --key "type" --value "user_connect" UserPropPut
  
  # Password:
  sacli --user $username --new_pass "$password" SetLocalPassword
  
  # CheckList Allow Auto-login:
  sacli --user $username --key "prop_autologin" --value "true" UserPropPut

  if [ $stat_statik == $YES ]
  then
    echo "Use Statik IP";
    sacli --user testing --key "conn_ip" --value "$stat_statik_subnets" UserPropPut
  else
    echo "Use Dynamic IP";
  fi

else
  echo "Use Dynamic IP";
fi


