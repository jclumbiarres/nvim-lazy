# Keymaps principales de tu configuración Neovim

## Globales

- `<C-s>` — Guardar archivo

## LazyGit

- `<leader>gg` — Abrir LazyGit en ventana flotante

## Telescope

- `<leader>km` — Buscar todos los keymaps activos (Telescope)
- `<leader>ff` — Buscar archivos
- `<leader>fb` — Buffers abiertos
- `<leader>fg` — Buscar texto (live grep)
- `<leader>fh` — Buscar ayuda
- `<leader>fr` — Archivos recientes

## Go

- `<leader>gT` — GoTestsAll (todas las pruebas)
- `<leader>gf` — GoTestFile (pruebas del archivo)
- `<leader>gi` — GoInstallDeps (instalar dependencias)
- `<leader>gm` — GoMod tidy
- `<leader>gt` — GoTestFunc (prueba función)

## LSP

- `<leader>lR` — Reiniciar LSP
- `<leader>la` — Code Action
- `<leader>lf` — Formatear con LSP
- `<leader>li` — Info de LSP
- `<leader>lr` — Renombrar símbolo

## Diagnóstico

- `<leader>df` — Diagnóstico flotante
- `<leader>dl` — Diagnóstico a loclist
- `<leader>dn` — Siguiente diagnóstico
- `<leader>dp` — Diagnóstico anterior

## Otros útiles

- `<leader>Q` — Cerrar todo
- `<leader>q` — Cerrar ventana
- `<leader>h` — Limpiar búsqueda
- `<leader>s` — Alternar spell
- `<leader>tf` — Terminal flotante
- `<leader>th` — Terminal horizontal
- `<leader>tv` — Terminal vertical

## Formateo y Linting (null-ls)

- `<leader>nf` — Formatear archivo con null-ls

## Tests (neotest)

- `<leader>tt` — Ejecutar test actual
- `<leader>tf` — Ejecutar todos los tests del archivo
- `<leader>ts` — Mostrar/ocultar resumen de tests
- `<leader>to` — Ver salida del test

## Notificaciones y UI

- `<leader>un` — Cerrar notificaciones (nvim-notify)

*Noice.nvim* mejora los mensajes y la UI de LSP automáticamente, sin keymaps extra necesarios.

## Harpoon

- `<leader>ha` — Guardar archivo en slot 1
- `<leader>hb` — Guardar archivo en slot 2
- `<leader>hc` — Guardar archivo en slot 3
- `<leader>hd` — Guardar archivo en slot 4
- `<leader>1` — Ir al archivo 1
- `<leader>2` — Ir al archivo 2
- `<leader>3` — Ir al archivo 3
- `<leader>4` — Ir al archivo 4
- `<leader>hl` — Mostrar menú de archivos Harpoon (Telescope)

## Debugger (DAP)

- `<leader>db` — Toggle Breakpoint
- `<leader>dc` — Continuar (Continue)
- `<leader>di` — Step Into
- `<leader>do` — Step Over
- `<leader>dO` — Step Out
- `<leader>dr` — Abrir REPL
- `<leader>dl` — Run Last
- `<leader>du` — Toggle DAP UI

## Orgmode

- `<leader>oa` — Org Agenda
- `<leader>oc` — Org Capture
- `<leader>ot` — Org TODO
- `<leader>on` — Abrir notas org (`~/org/notes.org`)
- `<leader>ox` — Org Tangle: exportar bloques de código a archivo
- `<leader>oe` — Ejecutar archivo tanglado (último exportado)