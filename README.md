# Configuración Neovim + Go + LazyGit

Esta configuración está pensada para desarrolladores Go que quieren una experiencia moderna, rápida y visual en Neovim, con integración de LazyGit y soporte para keymaps y Telescope.

## Instalación rápida

1. Clona este repositorio en `~/.config/nvim`.
2. Ejecuta el Makefile según tu sistema:
   - Para Debian/Ubuntu:
     ```sh
     make debian
     ```
   - Para Arch/Manjaro:
     ```sh
     make arch
     ```
   - Instala las herramientas de Go:
     ```sh
     make go-tools
     ```
3. Abre Neovim y espera a que se instalen los plugins la primera vez.

## Características principales

- **LSP para Go y TypeScript** (`gopls`, `tsserver`) con autoformato, helpers y tipos inline.
- **Telescope** para búsqueda de archivos, buffers, grep, ayuda y keymaps (`<leader>km`).
- **LazyGit** flotante con `<leader>gg`.
- **Depuración avanzada** con nvim-dap y Delve para Go.
- **Formateo y linting universal** con null-ls (`<leader>nf`).
- **Tests integrados** con neotest para Go y JavaScript/TypeScript (`<leader>tt`, `<leader>tf`, etc).
- **Notificaciones modernas** con nvim-notify.
- **UI mejorada** con noice.nvim para mensajes y LSP.
- **Orgmode** para gestión de tareas y notas estilo Emacs, con keymaps sencillos y directorio por defecto `~/org`.
- **Keymaps** productivos y organizados (ver `KEYMAPS.md`).
- **Configuración modular y limpia.**

## Atajos útiles

- `<leader>gg` — Abre LazyGit en ventana flotante.
- `<leader>km` — Busca todos los keymaps activos con Telescope.
- `<C-s>` — Guarda el archivo actual.
- `<leader>oa` — Org Agenda
- `<leader>oc` — Org Capture
- `<leader>ot` — Org TODO
- `<leader>on` — Abrir notas org (`~/org/notes.org`)
- Navegación de buffers, archivos, grep, ayuda, etc. con `<leader>f` + letra.


Consulta el archivo [`KEYMAPS.md`](KEYMAPS.md) para ver todos los keymaps y atajos de tests, formateo, notificaciones, etc.

## Requisitos
- Go >= 1.20
- Neovim >= 0.9
- Git, curl, ripgrep, fd, xclip, build tools, nodejs, npm, python3-pip, unzip, lazygit
- Para depuración Go: asegúrate de tener `$HOME/go/bin` en tu `PATH` para que Neovim encuentre `dlv` (Delve).
- Para orgmode: crea el directorio `~/org` para tus notas y tareas.

