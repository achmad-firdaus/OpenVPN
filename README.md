# OpenVPN <img src="https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width="30px">
This All Aboud OpenVPN Server and Client

#### LIST
- [About 👻](#about-)
- [Installation OpenVPN Server and Client](Installation.MD) ![](https://img.shields.io/badge/VPN-OpenVPN-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
- [Set Global Statis IP 👻](#set-global-statis-ip-)
- [Automate Script 👻](#automate-script-)

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

      wget https://raw.githubusercontent.com/achmad-firdaus/OpenVPN/main/c_uspw.sh
      
      Note:
      already for creating a user with a password, auto login, static ip, vpn gateway, delete

- Run script:

      bash ./c_uspw.sh CREATE/DELETE=<YES/NO> <USERNAME> <PASSWORD> AUTO_LOGIN=<YES/NO> STATIS_IP=<YES/NO> IF_YES=<IP_ADDRESS>/IF_NO=<0.0.0.0> VPN_GATEWAY=<YES/NO> HOW_MUCH_GATEWAY=<NUMBER>

  - for Create User (CREATE, USERNAME, PASSWORD, AUTO LOGIN, STATIC IP, IP ADDRESS STATIC, VPN GATEWAY, HOW MUCH GATEWAY)

          bash ./c_uspw.sh YES username password YES YES 172.16.1.5 YES 2
          

  - for Create User (CREATE, USERNAME, PASSWORD, AUTO LOGIN, STATIC IP, IP ADDRESS STATIC)

          bash ./c_uspw.sh YES username password YES YES 172.16.1.5 NO 0
          

  - for Create User (CREATE, USERNAME, PASSWORD, AUTO LOGIN)

          bash ./c_uspw.sh YES username password YES NO 0.0.0.0 NO 0


  - for Create User (CREATE, USERNAME, PASSWORD)

          bash ./c_uspw.sh YES username password NO NO 0.0.0.0 NO 0

  - for Delete User (DELETE, USERNAME)

          bash ./c_uspw.sh NO username 

        

