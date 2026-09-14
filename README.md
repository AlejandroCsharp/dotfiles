# dotfiles

Configuración personal de mi entorno de terminal en Linux: zsh + oh-my-posh, gestionada con [GNU Stow](https://www.gnu.org/software/stow/).

## Qué incluye

| Carpeta | Contenido |
| --- | --- |
| `zsh/` | `.zshrc` — historial compartido, sistema de completado de zsh, autosuggestions y syntax highlighting |
| `ohmyposh/` | Tema del prompt (`dracula.omp.json`) |

## Requisitos

- Una distro basada en Debian/Ubuntu (el instalador usa `apt`)
- Una terminal con soporte para Nerd Fonts (el instalador baja JetBrainsMono)

## Instalación

```bash
git clone https://github.com/AlejandroCsharp/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

El script se encarga de:

1. Instalar `zsh`, `stow`, `git`, `curl`, `unzip` y los plugins `zsh-autosuggestions` y `zsh-syntax-highlighting`
2. Instalar oh-my-posh en `~/.cache/oh-my-posh`
3. Descargar JetBrainsMono Nerd Font en `~/.local/share/fonts` y refrescar el caché de fuentes
4. Enlazar las configuraciones con `stow zsh ohmyposh`
5. Dejar zsh como shell por defecto (`chsh`)

Después hay que cerrar sesión y volver a entrar para que tome el cambio de shell.

### Fuente de la terminal

Una vez instalada la fuente, hay que seleccionar **JetBrainsMono Nerd Font** en las preferencias de la terminal. Si no, los íconos del prompt se ven como cuadraditos.

## Uso de Stow

Stow crea symlinks desde este repo hacia `$HOME`, así que se puede editar cualquier archivo desde acá o desde su ubicación normal — es el mismo archivo.

```bash
cd ~/dotfiles

stow zsh              # enlazar solo zsh
stow ohmyposh         # enlazar solo el tema del prompt
stow -D zsh           # desenlazar
stow -R zsh           # reenlazar (útil al agregar archivos nuevos)
```

## Agregar una configuración nueva

Cada carpeta del repo replica la estructura que tendría dentro de `$HOME`:

```
dotfiles/
└── nvim/
    └── .config/
        └── nvim/
            └── init.lua     →  ~/.config/nvim/init.lua
```

Creada la carpeta con esa jerarquía, alcanza con `stow nvim`.

## Atajos del prompt

| Tecla | Acción |
| --- | --- |
| `Tab` | Menú de completado (navegable con flechas) |
| `→` / `End` | Aceptar la sugerencia completa |
| `Ctrl` + `→` | Aceptar solo la siguiente palabra |

## Cambiar el tema del prompt

oh-my-posh tiene [una galería de temas](https://ohmyposh.dev/docs/themes). Para cambiarlo, basta con apuntar el `--config` del `.zshrc` a otro archivo `.omp.json` dentro de `ohmyposh/`.
