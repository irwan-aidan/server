#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
clear
read -p "Username : " Login
egrep "^$Login" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo "Username sudah ada didalam sistem. Sila gunakan username yang lain"
sleep 1
usernew
else
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akaun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
IP=$(wget -qO- icanhazip.com);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
#echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
egrep "^$Login" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass" | passwd $Login
cd
clear
echo -e ""
echo -e "==============================="
echo -e "      MAKLUMAT PORT ANDA       "
echo -e "==============================="
echo -e ""
echo -e "Host            : $IP"
echo -e "OpenSSH         : 22"
echo -e "Dropbear        : 109, 143"
echo -e "SSL/TLS         :$ssl"
echo -e "Port Squid      :$sqd"
echo -e "badvpn          : 7100-7300"
echo -e "OpenVPN TCP     : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN UDP     : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN SSL     : SSL 442 http://$IP:81/client-tcp-ssl.ovpn"
echo -e ""
echo -e "==============================="
echo -e "       PAYLOAD WEBSOCKET       "
echo -e "==============================="
echo -e "GET / HTTP/1.1[crlf]Host: MasukkanBugDisini[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e ""
echo -e "==============================="
echo -e "      MAKLUMAT AKAUN ANDA      "
echo -e "==============================="
echo -e ""
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Expired pada   : $exp"
echo -e ""
echo -e "==============================="
echo -e " TERIMA KASIH KERANA MELANGGAN "
echo -e "==============================="
echo -e ""
fi
