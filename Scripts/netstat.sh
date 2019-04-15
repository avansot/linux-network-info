#!/bin/bash
#*******************************
#**** LINUX NETWOK INFO v1.2****
#*******************************
#AUTOR : Carlos García
#EMAIL : avansot@gmail.com
#WEB   : https://youtube.com/user/avansot
#GITHUB: https://github.com/avansot
while [ 1 ]
do
   reset
   sudo netstat -putona
   echo -e "\n***USUARIOS ACTUALMENTE LOGUEADOS:"
   users
   
   echo -e "\n***MAS DETALLES:"
   w

   echo -e "\n***SSH:"
   function is_ssh() {
       p=${1:-$PPID}
       read pid name x ppid y < <( cat /proc/$p/stat )
       # or: read pid name ppid < <(ps -o pid= -o comm= -o ppid= -p $p) 
       [[ "$name" =~ sshd ]] && { echo "SSH Remoto: $pid $name"; return 0; }
       [ "$ppid" -le 1 ]     && { echo "Usuario Local: $USER is $pid $name";  return 1; }
       is_ssh $ppid
     }

   is_ssh $PPID


   sleep 10
done
