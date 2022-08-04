# OpenVPN <img src="https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width="30px">
This All Aboud OpenVPN Server and Client

#### LIST
- [About 👻](#about-)
- [Installation OpenVPN Server and Client](Installation.MD) ![](https://img.shields.io/badge/VPN-OpenVPN-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
- [Set Global Statis IP 👻](#set-global-statis-ip-)
- [Automate Script 👻](#automate-script-)
- [CLI 👻](#cli-openvpn-)

#### ABOUT 👻
  
    make sure you have installed openvpn server on the cloud and open vpn clint in your environment.
    
#### SET GLOBAL STATIS IP 👻

- Run on cloud vpn server:
  - Manual
  
        Directory sacli in: /usr/local/openvpn_as/scripts
        
        Backup Config: 
        sacli ConfigQuery > config_default.txt
        
        Add this variable run in command line:
        sed -i '59i "vpn.server.static.0.netmask_bits": "24", ' config_default.txt
        sed -i '60i "vpn.server.static.0.network": "172.16.1.0", ' config_default.txt
        
        Apply:
        sacli --value_file=config_default.txt ConfigReplace
        
        sacli start
    
  - alternative
  
        Directory sacli in: /usr/local/openvpn_as/scripts

        sacli --key "vpn.server.static.0.network" --value "<Ip Address>" ConfigPut
        sacli --key "vpn.server.static.0.netmask_bits" --value "<Matriks>" ConfigPut
        EX:
        sacli --key "vpn.server.static.0.network" --value "172.16.1.2" ConfigPut
        sacli --key "vpn.server.static.0.netmask_bits" --value "20" ConfigPut

    
#### Automate Script 👻

- Clone or Download this repo:

      wget https://raw.githubusercontent.com/achmad-firdaus/OpenVPN/main/c_uspw.sh
      
      Note:
      already for creating a user with a password, auto login, static ip, vpn gateway, delete

- Run script:

      bash ./c_uspw.sh CREATE/DELETE=<YES/NO> <USERNAME> <PASSWORD> AUTO_LOGIN=<YES/NO> STATIS_IP=<YES/NO> IF_YES=<IP_ADDRESS>/IF_NO=<0.0.0.0> VPN_GATEWAY=<YES/NO> HOW_MUCH_GATEWAY=<NUMBER>

  - for Create User 
    - CREATE, USERNAME, PASSWORD, AUTO LOGIN, STATIC IP, IP ADDRESS STATIC, VPN GATEWAY, HOW MUCH GATEWAY

          bash ./c_uspw.sh YES achmad password YES YES 172.16.1.5 YES 2
          
    - CREATE, USERNAME, PASSWORD, AUTO LOGIN, STATIC IP, IP ADDRESS STATIC

          bash ./c_uspw.sh YES achmad password YES YES 172.16.1.5 NO 0
          

    - CREATE, USERNAME, PASSWORD, AUTO LOGIN

          bash ./c_uspw.sh YES achmad password YES NO 0.0.0.0 NO 0


    - CREATE, USERNAME, PASSWORD

          bash ./c_uspw.sh YES achmad password NO NO 0.0.0.0 NO 0

  - for Delete User 
    - DELETE, USERNAME

          bash ./c_uspw.sh NO achmad 

        
#### CLI OPENVPN 👻

- Command Line:
  - List User
  
        sacli UserPropGet 
        
  - Add User
  
        sacli --user <USER_NAME> --key "type" --value "user_connect" UserPropPut
        Ex:
        sacli --user  achmad --key "type" --value "user_connect" UserPropPut

  - Add Password User
  
        sacli --user <USER_NAME> --new_pass <PASSWORD> SetLocalPassword
        Ex:
        sacli --user achmad --new_pass "password" SetLocalPassword
        
  - Check Allow Auto-login User
  
        sacli --user <USER_OR_GROUP> --key "prop_autologin" --value "true" UserPropPut
        Ex:
        sacli --user achmad --key "prop_autologin" --value "true" UserPropPut
                
  - Assign Static IP Address spesific user profile
  
        sacli --user <USER_NAME> --key "conn_ip" --value <IP_ADDRESS> UserPropPut
        Ex:
        sacli --user achmad --key "conn_ip" --value "172.16.1.205" UserPropPut

  - Access Control user profile
  
        access_to.N: N = 0-9
        access_to.0
        access_to.1
        access_to.2
        etc
        
        sacli --user <USER_NAME> --key "access_to.N" --value "+NAT:0.0.0.0/1" UserPropPut
        Ex:
        sacli --user achmad --key "access_to.0" --value "+NAT:10.10.0.0/1" UserPropPut
        
  - VPN Gateway user profile
  
        c2s_route.N: N = 0-9
        c2s_route.0
        c2s_route.1
        c2s_route.2
        etc
        
        sacli --user <USER_NAME> --key "c2s_route.N" --value "<subnet>" UserPropPut
        Ex:
        sacli --user achmad --key "c2s_route.0" --value "192.168.0.0/24" UserPropPut
                
  - Delete User
  
        sacli --user <USER_NAME> UserPropDelAll
        Ex:
        sacli --user achmad UserPropDelAll
        
