#!/bin/bash
#*******************************
#**** LINUX NETWOK INFO v1.2****
#*******************************
#AUTOR : Carlos García
#EMAIL : avansot@gmail.com
#WEB   : https://youtube.com/user/avansot
#GITHUB: https://github.com/avansot
echo -e "\e[41m******************************************\e[0m"
echo -e "\e[41m*** INSTALACIÓN DE HERRAMIENTAS DE RED ***\e[0m"
echo -e "\e[41m******************************************\e[0m\n"
echo -e "El presente script instalará las herramientas de red necesarias para utilizarlas en tu sistema GNU/Linux.\n"
echo -e "En caso de estar previamente ya instalada alguna de estas herramientas, simplemente se obviará y no se reinstalará.\n"
echo -e "Este script emplea repositorio Ubuntu y paquetes .DEB, por lo que para otras distruciones, necesitarás modificar este script.\n"
read -p "(*) Presione una tecla para continuar."
echo -e "\n\e[44m*** INSTALACIÓN DE GUFW ***\e[0m"
sudo apt install gufw
echo -e "\n\e[44m*** INSTALACIÓN DE CURL ***\e[0m"
sudo apt install curl
echo -e "\n\e[44m*** INSTALACIÓN DE VNSTAT ***\e[0m"
sudo apt install vnstat
echo -e "\n\e[44m*** INSTALACIÓN DE GNOME-TERMINAL ***\e[0m"
sudo apt install gnome-terminal 
echo -e "\n\e[44m*** INSTALACIÓN DE IPTRAF ***\e[0m"
sudo apt install iptraf
echo -e "\n\e[44m*** INSTALACIÓN DE NETHOGS ***\e[0m"
sudo apt install nethogs
echo -e "\n\e[44m*** INSTALACIÓN DE TCPTRACK ***\e[0m"
sudo apt install tcptrack
echo -e "\n\e[44m*** INSTALACIÓN DE NETDIAG (TRAFSHOW | NETWATCH) ***\e[0m"
sudo apt install netdiag
echo -e "\n\e[44m*** INSTALACIÓN DE WIRESHARK ***\e[0m"
sudo apt install wireshark-gtk
echo -e "\n\e[44m*** INSTALACIÓN DE NMAP ***\e[0m"
sudo apt install nmap
echo -e "\n\e[44m*** INSTALACIÓN DE MENU (SU-TO-ROOT) ***\e[0m"
sudo apt install menu
