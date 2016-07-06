KEYRING_NAME=$1
KEYS=$(cut -f3)
gpg --keyring ${KEYRING_NAME} --no-default-keyring --recv-keys ${KEYS}
