#!/bin/bash
#*******************************
#**** LINUX NETWOK INFO v1.2****
#*******************************
#AUTOR : Carlos García
#EMAIL : avansot@gmail.com
#WEB   : https://youtube.com/user/avansot
#GITHUB: https://github.com/avansot
clear
echo "*************************"
echo "*** IPtables Firewall ***"
echo "*************************"
echo
PS3="Seleccione una opcion: "
options=("Bloquear Solo Trafico Entrante {E}" "Bloquear Todo el Trafico {E/S}" "Bloquear Puertos" "Abrir Puertos" "Desinstalar Samba y RDPs" "RE/Instalar Samba" "Salir")

select opt in "${options[@]}"
do
    case $opt in

    "Bloquear Solo Trafico Entrante {E}")
		echo ===========================================
		echo "Opcion 01: Bloqueando Trafico Entrante {E}"
		echo ===========================================
		sudo iptables -F
		#BLOCK NETBIOS: 
		echo -e "\xE2\x9C\x94 Bloqueando ingreso por Netbios..."
		sudo iptables -A INPUT -p udp -m udp --dport 137 -j REJECT
		sudo iptables -A INPUT -p udp -m udp --dport 138 -j REJECT
		sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j REJECT
		sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j REJECT
		sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j REJECT

		echo -e "\xE2\x9C\x94 Bloqueando IPs Extrañas... (208.73.211.70)"
		sudo iptables -I INPUT -s 208.73.211.70 -j DROP
		#ipset add blacklist 208.73.211.70

		echo -e "\xE2\x9C\x94 Bloqueando todo el trafico entrante..."
		sudo iptables -P INPUT DROP
		sudo iptables -P FORWARD DROP
		sudo iptables -P OUTPUT ACCEPT
		sudo iptables -A INPUT -m state --state NEW,ESTABLISHED -j ACCEPT
		sudo iptables -L -v -n

		echo
		echo "Script Finalizado..."
		read -p "Presione una tecla para continuar."
		echo
		break
		;;

    "Bloquear Todo el Trafico {E/S}")
		echo
		echo ==========================================
		echo "Opcion 02: Bloquear Todo El Trafico {E/S}"
		echo ==========================================
		sudo iptables -P INPUT DROP
		sudo iptables -P FORWARD DROP
		sudo iptables -P OUTPUT DROP
		#sudo iptables -A INPUT -i lo -j ACCEPT
		#sudo iptables -A OUTPUT -o lo -j ACCEPT
		echo OK - Block All Traffic.
		echo "Script Finalizado..."
		echo
		break
        ;;


    "Bloquear Puertos")
		echo ============================
		echo "Opcion 03: Bloquear Puertos"
		echo ============================
                echo -e "\e[41m\xE2\x9C\x94 Bloqueando Puerto: 80:130:135:136:137:138:139:445:3338...\e[0m"
		sudo ufw deny 80
		sudo ufw deny 130
		sudo ufw deny 135
		sudo ufw deny 136
		sudo ufw deny 137
		sudo ufw deny 138
		sudo ufw deny 139
		sudo ufw deny 443
		sudo ufw deny 444
		sudo ufw deny 445
		sudo ufw deny 3338
		echo
		echo "Script Finalizado..."
		read -p "Presione una tecla para continuar."
		echo
		break
		;;

    "Abrir Puertos")
		echo =========================
		echo "Opcion 04: Abrir Puertos"
		echo =========================
                echo -e "\e[44m\xE2\x9C\x94 Abriendo Puerto: 80:130:135:136:137:138:139:445:3338...\e[0m"
		sudo ufw allow 80
		sudo ufw allow 130
		sudo ufw allow 135
		sudo ufw allow 136
		sudo ufw allow 137
		sudo ufw allow 138
		sudo ufw allow 139
		sudo ufw allow 443
		sudo ufw allow 444
		sudo ufw allow 445
		sudo ufw allow 3338
		echo
		echo "Script Finalizado..."
		read -p "Presione una tecla para continuar."
		echo
		break
		;;


	"Desinstalar Samba y RDPs")
		echo
		echo ====================================
		echo "Opcion 05: Desinstalar Samba y RDPs"
		echo ====================================

                #Provoca error en el sistema
                #echo -e "\e[41m\xE2\x9C\x94Inhabilitando /usr/lib/gvfs/...\e[0m"		
		#chmod 000 /usr/lib/gvfs/gvfsd-smb-browse
		#chmod 000 /usr/lib/gvfs/*


                echo -e "\e[41m\xE2\x9C\x94Desinstalando Vinagre...\e[0m"
		sudo apt-get remove --purge vinagre*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando Remina...\e[0m"
		sudo apt-get remove --purge remmina*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando rDesktop...\e[0m"
		sudo apt-get remove --purge rdesktop*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando Xrdp...\e[0m"
		sudo apt-get remove --purge xrdp*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando Krdc...\e[0m"
		sudo apt-get remove --purge krdc*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando TSclient...\e[0m"
		sudo apt-get remove --purge tsclient*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando GrDesktop...\e[0m"
		sudo apt-get remove --purge rdesktop*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando Gnom-Rdp...\e[0m"
		sudo apt-get remove --purge gnome-rdp*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando FreeRdp...\e[0m"
		sudo apt-get remove --purge freerdp*

                echo -e "\e[41m\xE2\x9C\x94Desinstalando SAMBA...\e[0m"
		sudo apt-get remove --purge samba samba-common
        	sudo apt-get remove --purge smbclient libsmbclient samba-libs
		echo
		sudo apt-get autoclean
		sudo apt-get clean
		sudo apt-get autoremove
                echo "Script Finalizado..."
		read -p "Presione una tecla para continuar."
		echo
		break
       		;;

	"RE/Instalar Samba")
		echo
		echo ====================================
		echo "Opcion 06: RE/Instalar Sambas"
		echo ====================================
		sudo apt-get -y update
		sudo apt-get -y install samba samba-common cifs-utils
		echo
		echo "Script Finalizado..."
		echo
		break
		;;
        "Salir")
		echo "..............................................."
		break
        ;;
    esac
done
