
echo "Sintaxis: "
echo " scan.sh ASN Puerto"
echo " "
echo "Ejemplo: "
echo " "
echo " scan 7226 443"
echo " el resultado se guarda en un TXT con el nombre del ASN"
echo " "
echo "Espere ..."


test=$(whois -h whois.cymru.com "dump AS$1" | grep -Eo  "([0-9]*\.){3}[0-9]*/[0-9]+" | sort -nu )


for i in $test; do masscan -p$2 $i | tee ASN$1.txt ; done


echo "Finalizado."
