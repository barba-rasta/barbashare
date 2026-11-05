#!/usr/bin/env bash
# Instalador de BarbaShare
set -e

REPO="https://raw.githubusercontent.com/barba-rasta/barbashare/main"
SCRIPT_NAME="barbashare"
ALIAS_NAME="barba-share"

echo "📡 Instalando BarbaShare..."

# Detectar destino
if [[ -n "${TERMUX_VERSION:-}" || -d /data/data/com.termux/files ]]; then
    DEST="${PREFIX:-/data/data/com.termux/files/usr}/bin"
elif [[ -w /usr/local/bin ]]; then
    DEST="/usr/local/bin"
else
    DEST="$HOME/.local/bin"
    mkdir -p "$DEST"
fi

# Descargar
TMP=$(mktemp)
if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$REPO/$SCRIPT_NAME" -o "$TMP"
elif command -v wget >/dev/null 2>&1; then
    wget -qO "$TMP" "$REPO/$SCRIPT_NAME"
else
    echo "✘ Necesitas curl o wget"
    exit 1
fi

chmod +x "$TMP"
cp "$TMP" "$DEST/$SCRIPT_NAME"
ln -sf "$DEST/$SCRIPT_NAME" "$DEST/$ALIAS_NAME" 2>/dev/null || true
rm -f "$TMP"

# Asegurar PATH
case ":$PATH:" in
    *":$DEST:"*) ;;
    *)
        if [[ -n "${TERMUX_VERSION:-}" ]]; then
            # En Termux suele estar ya
            :
        else
            echo "export PATH=\"\$PATH:$DEST\"" >> "$HOME/.bashrc" 2>/dev/null || true
            echo "export PATH=\"\$PATH:$DEST\"" >> "$HOME/.zshrc" 2>/dev/null || true
        fi
        ;;
esac

echo "✔ Instalado en $DEST/$SCRIPT_NAME"
echo "  También disponible como: $ALIAS_NAME"
echo
echo "Ahora escribe:"
echo "  barbashare"
echo "  o  barba-share"
