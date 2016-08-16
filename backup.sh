#!/bin/bash
 
_fecha=$(date +"%m_%d_%Y")
_destino="/mnt/usb/var_www_("$_fecha").tgz"
 
tar cfz $_destino /var/www/

#scp $_destino usuario@dominio.com:/home/usuario