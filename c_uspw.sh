#!/bin/sh
# 
# Create By Achmad
# Date: 04 August 2022
# Note:
# Usage for create user: bash ./c_uspw.sh YES {username} {password} AutoLogin:{YES/NO} StatikIP:{YES/NO} {IF Statik YES: Add IPaddress} VPNGATEWAY:{YES/NO} Count_VPNGATEWAY{Number} {subnet}
#                    EX: bash ./c_uspw.sh YES achmad password YES NO 0.0.0.0
#                    EX: bash ./c_uspw.sh YES achmad password YES YES 172.16.1.200
# Usage for delete user: bash ./c_uspw.sh NO {username} 

YES='YES'

create=$1

if [ $create == $YES ]
then
    echo "Create New User";

    #variable create
    username=$2
    password=$3
    autologin=$4
    stat_statik=$5
    stat_statik_IP=$6
    gatwayvpn=$7
    gatwayvpncount=$8

    # Add User:
    sacli --user $username --key "type" --value "user_connect" UserPropPut

    # Password:
    sacli --user $username --new_pass "$password" SetLocalPassword

    if [ $autologin == $YES ]
        then
            echo "Check Auto Login";
            # CheckList Allow Auto-login:
            sacli --user $username --key "prop_autologin" --value "true" UserPropPut
    else
        echo "NO Check Auto Login";
    fi

    if [ $stat_statik == $YES ]
        then
            echo "Use Statik IP";
            sacli --user $username --key "conn_ip" --value "$stat_statik_IP" UserPropPut
    else
        echo "Use Dynamic IP";
    fi

    if [ $gatwayvpn == $YES ]
        then
            echo "Use VPN Gateway";

            #Count GATEWAY VPN
            dl=$
            len=8
            for i in {1..$gatwayvpncount}
            do
                len=$(($len+1))
                # echo $len;
                # sacli --user testing --key "c2s_route.$i" --value "{$dl$len}" UserPropPut
#                 echo "sacli --user testing --key "c2s_route.$i" --value "$dl$len" UserPropPut";
                echo "Welcome $i times";
            done
    else
        echo "NO Use VPN Gateway";
    fi

else
    echo "Delete User";

    #variable create
    username=$2

    sacli --user $username UserPropDelAll
  
fi

sacli start

