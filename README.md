# OpenVPN <img src="https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width="30px">
This All Aboud OpenVPN Server and Client

#### LIST
- [About 👻](#about-)
- [Set Global Statis IP 👻](#set-global-statis-ip-)
- [Automate Script 👻](#create-)

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
    
  - Automate
  
        Directory sacli in: /usr/local/openvpn_as/scripts

        sacli --key "vpn.server.static.0.network" --value "<Ip Address>" ConfigPut
        sacli --key "vpn.server.static.0.netmask_bits" --value "<Matriks>" ConfigPut
        EX:
        sacli --key "vpn.server.static.0.network" --value "172.16.1.2" ConfigPut
        sacli --key "vpn.server.static.0.netmask_bits" --value "20" ConfigPut

    
#### Automate Script 👻

- Clone or Download this repo:

      git clone https://github.com/achmad-firdaus/OpenVPN.git
      
      Note:
      already for creating a user with a password, auto login, static ip, vpn gateway

- Run script:

      bash ./c_uspw.sh CREATE/DELETE=<YES/NO> <USERNAME> <PASSWORD> AUTO_LOGIN=<YES/NO> STATIS_IP=<YES/NO> IF_YES=<IP_ADDRESS>/IF_NO=<0.0.0.0> VPN_GATEWAY=<YES/NO> HOW_MUCH_GATEWAY=<NUMBER>

  - for Create User

          bash ./c_uspw.sh YES username password YES YES 172.16.1.5 YES 2

  - for Delete User

          bash ./c_uspw.sh NO username 

        

