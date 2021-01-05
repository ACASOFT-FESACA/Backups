#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
export PATH
clear
echo "BIENVENIDO AL CENTRO DE BACKUP'S";
echo
echo

systemctl status mariadb | grep inactive > /dev/null

if [ $? = 0 ]
then
echo "POR EL MOMENTO EL SERVICIO DE RESPALDO ESTA FUERA DE SERVICIO";

####################################3333

# Script para usar con cualquier tipo de Shell Linux (Bash, etc)
# Se puede usar para monitorización o para enviar alertas por SMS.
# Ejemplo de script usando curl como navegador.
# curl cierra la sesión al finalizar la petición de envío de SMS.

function envia_sms()
{
MENSAJE_SMS="$1"

# XX, YY y ZZ son los valores de identificación del usuario en el sistema
# Altiria proporciona esos datos al solicitar una cuenta gratuita de prueba
# Se usa un remitente RR que debe ser autorizado por Altiria. No disponible en todos los países.
# Se debe omitir el parámetro senderId si no se dispone de él.

COMANDO="cmd=sendsms&domainId=test&login=sponjaunam@gmail.com&passwd=33spon8247&dest=525565263549&msg=$MENSAJE_SMS"

# Se hace la petición
/usr/bin/curl -d "${COMANDO}" http://www.altiria.net/api/http -post

}

# $1 es el parámetro que se pasa al llamar la funcion envia_sms()
# $1 contiene el texto de alarma que se desee enviar por SMS.
# Se llamará a la función envia_sms() de la siguiente forma:
ASUNTO="ERROR:BASE DE DATOS CAIDA, APRESURATE GOKU"
envia_sms "$ASUNTO"
####################
else
echo "recuerda que el nombre del archivo es respaldo seguido de la fecha automaticamente";

 mysqldump -B --all-databases > Backups/respaldo_`date +%d-%m-%y_%H:%M:%S`.sql
 git add .
git commit -m "prueba"
git push -u origin master

 echo  "PROCESO EXITOSO "
 echo  "PROCESO EXITOSO. \nINGRESA AL REPOSITORIO GIT PARA CORROBORAR. \n:) :) :)"

###########

function envia_sms()
{
MENSAJE_SMS="$1"



COMANDO="cmd=sendsms&domainId=test&login=sponjaunam@gmail.com&passwd=33spon8247&dest=525565263549&msg=$MENSAJE_SMS"

# Se hace la petición
/usr/bin/curl -d "${COMANDO}" http://www.altiria.net/api/http -post

}

# $1 es el parámetro que se pasa al llamar la funcion envia_sms()
# $1 contiene el texto de alarma que se desee enviar por SMS.
# Se llamará a la función envia_sms() de la siguiente forma:
ASUNTO="BACKUP EXITOSO,PUEDES COMPROBAR EN: https://github.com/ACASOFT-FESACA/Backups"
envia_sms "$ASUNTO"

########
fi
