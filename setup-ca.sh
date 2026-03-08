read -p  "Enter path certificate: "  path_cert

sed -i 's/.demoCA/$path_cert/g' /etc/ssl/openssl.cnf
sed -i 's/# copy_extensions = copy/copy_extensions = copyall/g' /etc/ssl/openssl.cnf
sed -i 's/policy_match/policy_anything/g' /etc/ssl/openssl.cnf

mkdir -p "$path_cert"
mkdir -p "$path_cert/certs"
mkdir -p "$path_cert/newcerts"
mkdir -p "$path_cert/private"
touch "$path_cert/index.txt"
echo 01 >> "path_certs/serial"

openssl req -new -nodes -x509 -out "$path_cert/cacert.pem" -keyout "$path_cert/private/cakey.pem" -days 3650 
