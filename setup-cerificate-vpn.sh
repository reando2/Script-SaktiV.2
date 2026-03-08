read -p "Certificate Name: " cert_name
read -p "PrivateKey Name: " priv_name
read -p "Enter Common Name: " com_name

openssl req -new -nodes -out "request/$cert_name.req" -keyout "private/$priv_name" \
	-subj "/C=ID/CN=$com_name/O=ITNSA" \
	-addext "keyUsage = critical, keyCertSign" \
	-addext "extendedKeyUsage = serverAuth"

openssl ca -in "request/$cert_name.req" -out "certs/cert_name.pem" -days 1024

