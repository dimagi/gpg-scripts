function dimagi-gpg() {
	gpg --homedir . --keyring ${KEYRING_NAME} --no-default-keyring $@
}

function encrypt_for_key() {
	DIRECTORY=$1; shift
	NAME=$1; shift
	KEY=$1; shift
	MESSAGE=$@
	echo $NAME,$MESSAGE
	echo $MESSAGE | dimagi-gpg --recipient ${KEY} --encrypt --armor > ${DIRECTORY}/${NAME}.gpg
}

KEYRING_NAME=$1; shift
DIRECTORY=$1; shift
mkdir -p ${DIRECTORY}

echo ${KEYRING_NAME},${DIRECTORY}
while read LINE
do
	encrypt_for_key ${DIRECTORY} ${LINE}
done

zip -r ${DIRECTORY} ${DIRECTORY}
