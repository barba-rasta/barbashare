# 📡 BarbaShare v3.1

**Herramienta creada por Jorge Barba**

Comparte archivos o **carpetas** con un enlace público, con **reproductor multimedia web**, y también **recibe** archivos.

Compatible con **Termux / Linux / VPS**.

## ✨ Características

- 📤 Comparte archivos y carpetas completas
- 🎧 Reproductor web con portada, letras sincronizadas (.lrc), subtítulos, velocidad, búsqueda
- 📥 Recibe archivos de otras personas
- 🔑 Contraseña, tiempo de expiración y límite de aperturas
- 🌐 6 túneles + modo Wi-Fi local
- 🎬 Panel de YouTube: buscar y descargar (con yt-dlp)
- 🧪 Prueba de servidores
- Hecho especialmente para Termux

## 📦 Instalación

### Método recomendado (Termux / Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/barba-rasta/barbashare/main/install.sh | bash
```

Esto instala el comando `barbashare` (y también `barba-share` como alias).

### Instalación manual

```bash
# Descargar
curl -fsSL https://raw.githubusercontent.com/barba-rasta/barbashare/main/barbashare -o barbashare
chmod +x barbashare

# Instalar (copia a $PREFIX/bin o ~/.local/bin)
bash barbashare --instalar
```

### Paquete .deb (Termux)

```bash
# Descargar el .deb desde Releases
pkg install ./barba-share_3.1_all.deb
```

## 🚀 Uso

```bash
barbashare                  # menú principal
barbashare cancion.mp3      # comparte ese archivo
barbashare MiCarpeta        # comparte la carpeta
barbashare -z MiCarpeta     # carpeta en un .zip
barbashare -p auto a.mp4    # con contraseña
barbashare -t 30 -x 1 a.zip # 30 min / 1 apertura
barbashare -r               # recibir archivos
barbashare -m local a.mp4   # solo en tu Wi-Fi
barbashare --youtube        # panel YouTube
barbashare --probar         # prueba servidores
```

### Métodos de túnel (`-m`)

`auto` | `cloudflared` | `pinggy` | `lhr` | `serveo` | `tuns` | `lt` | `local` | `self`

## 📋 Opciones

| Opción | Descripción |
|--------|-------------|
| `-m, --metodo M` | Método de túnel |
| `-p, --clave [X]` | Contraseña (o `auto`) |
| `-t, --tiempo N` | Cierre automático en N minutos |
| `-x, --max N` | Límite de aperturas |
| `-z, --zip` | Carpetas como .zip |
| `-n, --sin-reproductor` | Sin reproductor web |
| `-r, --recibir` | Modo recibir |
| `--youtube` | Panel YouTube |
| `--probar` | Prueba de servidores |
| `--actualizar` | Actualiza yt-dlp |
| `--instalar` | Instala el comando |
| `--desinstalar` | Quita el comando |

## 📄 Licencia

MIT License - Creado por **Jorge Barba**

---

**BarbaShare** · Hecho con ♥ para la comunidad Termux
