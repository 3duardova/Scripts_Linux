# Este script unicamente extrae todos los segmentos que publica un ASN
# y escanea un puerto especifico
# requiere los paquetes "whois" y "masscan" así como permisos de root

echo "Sintaxis: "
echo " scan.sh ASN Puerto"
echo " "
echo "Ejemplo: "
echo " "
echo " scan 7226 443"
echo " el resultado se guarda en un TXT con el nombre del ASN"
echo " "
echo "Espere ..."

Segmentos=$(whois -h whois.cymru.com "dump AS$1" | grep -Eo  "([0-9]*\.){3}[0-9]*/[0-9]+" | sort -nu )

for i in $Segmentos; do masscan -p$2 $i | tee ASN$1.txt ; done

echo "Finalizado."
