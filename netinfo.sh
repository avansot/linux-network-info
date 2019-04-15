#!/bin/bash
#*******************************
#**** LINUX NETWOK INFO v1.2****
#*******************************
#AUTOR : Carlos García
#EMAIL : avansot@gmail.com
#WEB   : https://youtube.com/user/avansot
#GITHUB: https://github.com/avansot
clear
echo "*******************************"
echo "*** LINUX NETWORK INFO v1.2 ***"
echo "*******************************"
route -n 
vnstat 
echo "----------------------------" 
MyHostname=$(hostname -I)
MyHostExternal=$(curl -s ipecho.net/plain;echo)
echo " (*) IPs: $MyHostname:: $MyHostExternal"
RESULT=`service --status-all | grep ufw`
if [ "${RESULT:-null}" = null ]; then
  echo " (*) Firewall Desactivado o No Instalado (sudo apt install gufw)..."
else
  echo " (*) Firewall en ejecución (más info en la opción 10)"
fi
echo "----------------------------" 
PS3="Seleccione una opcion: "
options=("iptraf-ng" "netstat y usuarios" "ss -tup (*)" "tcptrack" "netwatch" "trafshow" "nethogs" "nmap" "wireshark" "Firewall Reglas" "Mas Opciones..." "Salir")

select opt in "${options[@]}"
do
    case $opt in

    "iptraf-ng")
       sudo iptraf-ng
       break;;
       
    "netstat y usuarios")
       netstat.sh
       break;;
       
    "ss -tup (*)")
       watch ss -tup
       break;;

    "tcptrack")
       sudo tcptrack -i enp5s0
       break;;

    "netwatch") 
       sudo netwatch -e enp5s0 –nt 
       break;;

    "trafshow")
       sudo trafshow -i enp5s0
       break;;

    "nethogs")
       sudo nethogs
       break;;
       
    "nmap")
       echo -e "\n\n\e[41mCONOCER DISPOSITIVOS EN LA RED LOCAL\e[0m"
       sudo nmap -sP 192.168.1.1-254
       echo -e "\n\n\e[41mDESCUBRIR PUERTOS ABIERTOS\e[0m"
       nmap -p 1-65535 -T4 -A -v 192.168.1.1-254
       break;;

    "wireshark")
       su-to-root -X -c wireshark-gtk
       break;;

     "Firewall Reglas")
       sudo ufw status verbose
       read -p "Presione una tecla para continuar..."
       break;;

    "Mas Opciones...")
       source security.sh
       break;;

    "Salir")
       break;;

    esac
done
    
    
