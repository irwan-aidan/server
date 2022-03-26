#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
cd
clear
read -p "         Username       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "         Day Extend     :  " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e ""
echo -e "========================================="
echo -e " MAKLUMAT AKAUN YANG TELAH DITAMBAH MASA "
echo -e "========================================="
echo -e ""
echo -e "Username                  : $User"
echo -e "Jumlah hari yang ditambah : $Days Days"
echo -e "Expired pada              : $Expiration_Display"
echo -e ""
echo -e "========================================="
echo -e "      TERIMA KASIH KERANA MELANGGAN      "
echo -e "========================================="
else
clear
echo -e ""
echo -e "========================================="
echo -e ""
echo -e "        Username Doesnt Exist        "
echo -e ""
echo -e "========================================="
fi
