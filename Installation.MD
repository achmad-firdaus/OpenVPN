# Installation OpenVPN <img src="https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width="30px">

#### LIST
- [About 👻](#about-)
- [Installation OpenVPN Server in Cloud 👻](#installation-openvpn-server-)
- [Installation OpenVPN Client 👻](#installation-openvpn-client-)

#### ABOUT 👻
  
    This for installation OpenVPN Server in Cloud and OpenVPN Client in your environment.
    
#### INSTALLATION OPENVPN SERVER 👻

- Run on Cloud:
  - Install dependencies:
        
        apt install ca-certificates wget net-tools gnupg
    
  - Search Code Name Debian
  
        lsb_release -a
        
        Result Codename: jammy
       ![image](https://user-images.githubusercontent.com/77251566/182970085-72d02eb5-3def-421b-815c-6122bfe16362.png)

  - Add OpenVpn Server in repo list (Please Change code_name_debian):

        wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
        echo "deb http://as-repository.openvpn.net/as/debian [code_name_debian] main" > /etc/apt/sources.list.d/openvpn-as-repo.list 
        apt update

    - If install OpenVpn Error like this: 
  
          W: http://as-repository.openvpn.net/as/debian/dists/focal/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.

      - Solve: 

            apt-key list
           ![image](https://user-images.githubusercontent.com/77251566/182970792-bb10758a-2e78-4a96-8701-b797c6c6d9c2.png)
            
            sudo apt-key export 3AAAAA96 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/openvpn.gpg
            (NOTE: The 3AAAAA96 value comes from the last 8 characters of the pub code from the apt-key list output OpenVpn.
            
  - Install OpenVPN Server:

        apt install openvpn-as
        

  - NOTE:

        After installing you can create users and settings according to your needs.
        
  - UI WEB:

        Admin UI: https://<YourURL>:<PORT>/admin/
    
#### INSTALLATION OPENVPN CLIENT 👻

- Run on Your Environment:
  - Install OpenVPN Client:
        
        apt update 
        apt install openvpn
    
  - Connect OpenVPN
  
        Login Web UI Client -> input username and password -> Click Yourself (autologin profile)
        sudo openvpn –-config [file_name_download].ovpn
        
  - UI WEB:

        Client UI: https://<YourURL>:<PORT>/
        

