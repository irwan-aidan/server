#!/bin/bash
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'

clear 
cat /usr/bin/bannerku | lolcat
echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/v2ray/domain)
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "   \e[032;1m• CPU Model             :\e[0m$cname"
	echo -e "   \e[032;1m• Number Of Cores       :\e[0m $cores"
	echo -e "   \e[032;1m• CPU Frequency         :\e[0m$freq MHz"
	echo -e "   \e[032;1m• Total RAM             :\e[0m $tram MB"
	echo -e "   \e[032;1m• System Uptime         :\e[0m$up"
	echo -e "   \e[032;1m• IP VPS                :\e[0m $IPVPS"
	echo -e "   \e[032;1m• Domain                :\e[0m $DOMAIN"
echo -e  ""
echo -e  "   ═══════════════════════MENU OPTIONS═══════════════════════" | lolcat
echo -e  ""
echo -e   "   1\e[1;33m)\e[m Panel SSH & OpenVPN "
echo -e   "   2\e[1;33m)\e[m Panel Wireguard "
echo -e   "   3\e[1;33m)\e[m Panel L2tp & Pptp Account"
echo -e   "   4\e[1;33m)\e[m Panel Sstp  Account"
echo -e   "   5\e[1;33m)\e[m Panel Ssr & Ss Account"
echo -e   "   6\e[1;33m)\e[m Panel v2ray"
echo -e   "   7\e[1;33m)\e[m Panel Vless"
echo -e   "   8\e[1;33m)\e[m Panel Trojan"
echo -e   "   9\e[1;33m)\e[m Panel TrojanGO"
echo -e   "   10\e[1;33m)\e[m Panel Acak Acak"
echo -e  ""
echo -e   "  \e[1;32m═══════════════════════════════════════════════════════════" | lolcat
echo -e   "                         SYSTEM MENU" | lolcat 
echo -e   "  \e[1;32m═══════════════════════════════════════════════════════════" | lolcat
echo -e  ""
echo -e   "   11\e[1;33m)\e[m  Add Subdomain Host For VPS"
echo -e   "   12\e[1;33m)\e[m  Renew Certificate V2RAY"
echo -e   "   13\e[1;33m)\e[m  Change Port All Account"
echo -e   "   14\e[1;33m)\e[m  Autobackup Data VPS"
echo -e   "   15\e[1;33m)\e[m  Backup Data VPS"
echo -e   "   16\e[1;33m)\e[m  Restore Data VPS"
echo -e   "   17\e[1;33m)\e[m  Webmin Menu"
echo -e   "   18\e[1;33m)\e[m  Limit Bandwith Speed Server"
echo -e   "   19\e[1;33m)\e[m  Check Usage of VPS Ram" 
echo -e   "   20\e[1;33m)\e[m  Reboot VPS"
echo -e   "   21\e[1;33m)\e[m  Speedtest VPS"
echo -e   "   22\e[1;33m)\e[m  Information Display System" 
echo -e   "   23\e[1;33m)\e[m  Info Script Auto Install"
echo -e   "   24\e[1;33m)\e[m  Install BBR"
echo -e   "   25\e[1;33m)\e[m  Add ID Cloudflare"
echo -e   "   26\e[1;33m)\e[m  Cloudflare Add-Ons"
echo -e   "   27\e[1;33m)\e[m  Pointing BUG"
echo -e   "   28\e[1;33m)\e[m  Clear log"
echo -e   "   29\e[1;33m)\e[m  Auto Reboot"
echo -e   "   30\e[1;33m)\e[m  Pointing VPS"
echo -e   "   31\e[1;33m)\e[m  Service Status"
echo -e   "   32\e[1;33m)\e[m  Cek Bandwidth VPS"
echo -e   "   33\e[1;33m)\e[m  Install Paket"
echo -e   "   34\e[1;33m)\e[m  Klik 34 - 35 Aktifkan Menu Acak"
echo -e  ""
echo -e   "  \e[1;32m═══════════════════════════════════════════════════════════" | lolcat
echo -e   "   x)   Exit" | lolcat
echo -e   "  \e[1;32m═══════════════════════════════════════════════════════════" | lolcat
echo -e   ""
read -p "     Select From Options [1-35 or x] :  " menu
echo -e   ""
echo -e   ""
echo -e   ""
case $menu in
1)
ssh
;;
2)
wgr
;;
3)
l2tp
;;
4)
sstpp
;;
5)
ssssr
;;
6)
v2raay
;;
7)
vleess
;;
8)
trojaan
;;
9)
trojangoo
;;
10)
acak
;;
11)
add-host
;;
12)
certv2ray
;;
13)
change-port
;;
14)
autobackup
;;
15)
backup
;;
16)
restore
;;
17)
wbmn
;;
18)
limit-speed
;;
19)
ram
;;
20)
reboot
;;
21)
speedtest
;;
22)
info
;;
23)
about
;;
24)
bbr
;;
25)
cff
;;
26)
cfd
;;
27)
cfh
;;
28)
clear-log
;;
29)
autoreboot
;;
30)
pointing
;;
31)
gabut
;;
32)
vnstat
;;
33)
install
;;
34)
wget -O /usr/bin/acak https://halucok.me/menu-all/acak.sh && chmod +x /usr/bin/acak && cd /usr/bin && apt install -y dos2unix && dos2unix acak
;;
35)
wget -O /usr/bin/install https://halucok.me/menu-all/install.sh && chmod +x /usr/bin/install && cd /usr/bin && apt install -y dos2unix && dos2unix install
;;
x)
exit
;;
*)
clear
menu
;;
esac