KEYRING_NAME=$1
KEYS=$(cut -f1)
echo "Creating keyring ${KEYRING_NAME} with keys: ${KEYS}"
gpg --keyring ${KEYRING_NAME} --no-default-keyring --recv-keys ${KEYS}
