#!/bin/sh

set -e

REPO="someram/pokedoxcli"
VERSION="v1.0.0"
BINARY="pokedoxcli"

OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Linux)
    OS_NAME="linux"
    ;;
  Darwin)
    OS_NAME="darwin"
    ;;
  *)
    echo "Unsupported operating system: $OS"
    exit 1
    ;;
esac

case "$ARCH" in
  x86_64|amd64)
    ARCH_NAME="amd64"
    ;;
  arm64|aarch64)
    ARCH_NAME="arm64"
    ;;
  *)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

FILE="${BINARY}-${OS_NAME}-${ARCH_NAME}"
URL="https://github.com/${REPO}/releases/download/${VERSION}/${FILE}"

echo "Downloading PokeDox CLI..."
curl -fL "$URL" -o "/tmp/$BINARY"

chmod +x "/tmp/$BINARY"

if [ -w "/usr/local/bin" ]; then
    mv "/tmp/$BINARY" "/usr/local/bin/$BINARY"
else
    sudo mv "/tmp/$BINARY" "/usr/local/bin/$BINARY"
fi

echo "PokeDox CLI installed successfully."
echo "Run: pokedoxcli"
