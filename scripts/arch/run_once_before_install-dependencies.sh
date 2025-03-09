#!/bin/sh

BIN_DIR="/home/joskaf/.local/bin"
CHROMA_VERSION="2.15.0"

# Ensure bin dir exists

if [[ ! -d "$BIN_DIR" ]]; then
    mkdir -p "$BIN_DIR" || exit 1
fi

# Download chroma

CHROMA_CHECKSUM_FILE="chroma-$CHROMA_VERSION-checksums.txt"
CHROMA_TGZ_FILE="chroma-$CHROMA_VERSION-linux-amd64.tar.gz"
CHROMA_TMP_DIR="/tmp/chroma-install"

mkdir -p "$CHROMA_TMP_DIR" || exit 1
pushd "$CHROMA_TMP_DIR" || exit 1

wget -q "https://github.com/alecthomas/chroma/releases/download/v$CHROMA_VERSION/$CHROMA_TGZ_FILE"
wget -q "https://github.com/alecthomas/chroma/releases/download/v$CHROMA_VERSION/$CHROMA_CHECKSUM_FILE"

sha256sum -c <(cat $CHROMA_CHECKSUM_FILE | grep linux-amd) || exit 1

tar -xf "$CHROMA_TGZ_FILE" || exit 1

mv "chroma" "$BIN_DIR/"

popd || exit 1

rm -rf "$CHROMA_TMP_DIR" || exit 1
