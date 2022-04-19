#/usr/bin/bash



#These names should never be changed, as many script in the dockerfile refers to them
KEY=vnc-server-private.pem
CERT=vnc-server.pem
DAYS=365

set -e

if [[ $# -ne 1 ]]; then
	echo "Needs 1 argument, ${#} was given";
    echo "Usage : $0 [SERVER IP]"
	exit 1;
fi

##Key&Cert deletion if they already exits##

if [[ -e $KEY ]]; then
    echo "Removing old $KEY"
    rm --interactive=never $KEY
fi
if [[ -e $CERT ]]; then
    echo "Removing old $CERT"
    rm --interactive=never $CERT
fi


##Key generation##
which openssl
if [[ $? -eq 0 ]]; then
    openssl req -x509 -newkey rsa -days $DAYS -nodes -config /etc/ssl/openssl.cnf -keyout $KEY -out $CERT -subj "/CN=${1}"

    sleep 1
    chmod 400 $KEY
    chmod 400 $CERT
    echo "Key generation done."
    echo "Keys are usable for ${DAYS} days from now on."
else
    echo "openssl not found"
    exit 1
fi


for i in ./*/cert/ # iterate over all dir in current dir
do
    if [[ -e $i$KEY ]]; then
        rm --interactive=never $i$KEY
    fi
    if [[ -e $i$CERT ]]; then
        rm --interactive=never $i$CERT
    fi
    echo "Copying keys to ${i}"
    cp $KEY "$i" 
    cp $CERT "$i"

done



echo "Done."
echo "The $KEY file is PRIVATE, it should only be stored in the Docker image and NEVER be shared"
echo "The $CERT file is PUBLIC, share it with whoever needs to connect to your client Docker image"

exit 0