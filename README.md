# Neovim config

Configuración personal de Neovim, modular y administrada con
[`lazy.nvim`](https://github.com/folke/lazy.nvim).

## Características

- LSP mediante Mason y `nvim-lspconfig`.
- Autocompletado con Blink.
- Búsqueda con Telescope.
- Resaltado y análisis sintáctico con Treesitter.
- Formato con Conform y análisis de Python mediante Ruff LSP.
- Integración con Git mediante Gitsigns.
- Depuración de Python y C/C++ mediante DAP.
- Ejecución y depuración de pruebas Python mediante Neotest y Pytest.
- Soporte configurado para Lua, Python, C, C++, Bash y LaTeX.
- Modo ligero automático para archivos mayores de 2 MiB.
- Dashboard Dracula con citas de ciencia, docencia y programación.
- Autopairs, detección de indentación y textobjects de Treesitter.
- Resaltado visual de valores de color.

## Instalación

Respalda cualquier configuración existente y clona el repositorio:

```bash
git clone https://github.com/d4vtz/neovim_config.git ~/.config/nvim
nvim
```

En el primer inicio, `lazy.nvim` se instalará automáticamente.

## Dependencias

Dependencias generales:

- Neovim 0.12 o posterior
- Git
- `make`, para compilar `telescope-fzf-native`
- `tree-sitter-cli` 0.26.1 o posterior
- un compilador de C para los parsers de Treesitter
- una Nerd Font 3.3 o posterior
- `ripgrep` y `fd`, recomendados para Telescope

Formateadores instalados automáticamente mediante Mason:

- Lua: `stylua`
- Python: `ruff`
- C y C++: `clang-format`

Linters instalados automáticamente mediante Mason:

- Bash y shell: `shellcheck`
- LaTeX: `chktex`

Adaptadores de depuración instalados automáticamente mediante Mason:

- Python: `debugpy`
- C y C++: `codelldb`

Las pruebas Python requieren `pytest` dentro del entorno del proyecto. En proyectos administrados con `uv`, instálalo con `uv add --dev pytest`.

LaTeX utiliza el `latexindent` proporcionado por TeX Live. También requiere `latexmk` para compilar y `zathura` para la búsqueda inversa. Los servidores de lenguaje y el resto de los formateadores se administran desde `:Mason`.

Mason comprueba las herramientas declaradas tres segundos después del inicio y, como máximo, una vez por semana. Las sesiones headless omiten esta comprobación automática.

## Estructura

```text
init.lua
lua/
├── config/       # opciones, atajos, autocmds y arranque de lazy.nvim
└── plugins/      # especificaciones de plugins por funcionalidad
```

## Atajos principales

La tecla líder es `Espacio`. Ejecuta `:WhichKey` o pulsa la tecla líder para
consultar los grupos disponibles.

| Atajo | Acción |
|---|---|
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Buscar texto |
| `<leader>fw` | Buscar la palabra bajo el cursor |
| `<leader>fd` | Buscar diagnósticos |
| `<leader>fR` | Reanudar la última búsqueda |
| `<leader>ee` | Abrir o cerrar Neo-tree |
| `<leader>er` | Revelar el archivo actual en Neo-tree |
| `<leader>cf` | Formatear el buffer |
| `<leader>cl` | Ejecutar el linter del buffer |
| `<leader>w` | Guardar el archivo |
| `<leader>qq` | Salir |
| `<leader>qw` | Guardar y salir |
| `<leader>ds` | Buscar símbolos del documento |
| `<leader>dS` | Buscar símbolos del workspace |
| `<leader>dt` | Buscar definiciones de tipo |
| `af` / `if` | Seleccionar función exterior / interior |
| `ac` / `ic` | Seleccionar clase exterior / interior |
| `aa` / `ia` | Seleccionar argumento exterior / interior |
| `]f` / `[f` | Función siguiente / anterior |
| `]F` / `[F` | Clase siguiente / anterior |
| `<leader>sn` / `<leader>sp` | Intercambiar argumentos |
| `<leader>xx` | Mostrar diagnósticos |
| `<leader>xX` | Mostrar diagnósticos del buffer actual |
| `<leader>xe` | Mostrar solamente errores |
| `<leader>xs` | Mostrar símbolos del documento |
| `<leader>xl` | Mostrar definiciones y referencias LSP |
| `<leader>xQ` | Mostrar la lista quickfix |
| `<leader>xL` | Mostrar la location list |
| `<C-\\>` | Abrir una terminal flotante |
| `<leader>th` | Abrir una terminal horizontal |
| `<leader>tv` | Abrir una terminal vertical |
| `<leader>ts` | Seleccionar una terminal |
| `<leader>ta` | Mostrar u ocultar todas las terminales |
| `<S-h>` / `<S-l>` | Buffer anterior / siguiente |
| `<leader>bp` | Elegir un buffer |
| `<leader>bd` | Cerrar el buffer actual |
| `<leader>bo` | Cerrar los demás buffers |
| `<leader>br` | Cerrar buffers a la derecha |
| `<leader>bl` | Cerrar buffers a la izquierda |
| `<F5>` | Iniciar o continuar la depuración |
| `<F10>` / `<F11>` / `<F12>` | Paso sobre / dentro / fuera |
| `<leader>Db` | Alternar breakpoint |
| `<leader>DB` | Crear breakpoint condicional |
| `<leader>Dc` | Ejecutar hasta el cursor |
| `<leader>Du` | Alternar la interfaz de depuración |
| `<leader>Dt` | Terminar la depuración |
| `<leader>pn` | Ejecutar la prueba cercana |
| `<leader>pf` | Ejecutar el archivo de pruebas |
| `<leader>pa` | Ejecutar todas las pruebas |
| `<leader>pd` | Depurar la prueba cercana |
| `<leader>ps` | Alternar el resumen de pruebas |
| `<leader>po` | Mostrar la salida de la prueba |
| `<leader>nd` | Descartar notificaciones |
| `<leader>nh` | Abrir el historial de notificaciones |
| `<leader>qs` | Restaurar la sesión del directorio actual |
| `<leader>qS` | Seleccionar una sesión guardada |
| `<leader>ql` | Restaurar la última sesión |
| `<leader>qd` | Desactivar el guardado de la sesión actual |
| `]h` / `[h` | Hunk siguiente / anterior |
| `<leader>hs` | Añadir el hunk al stage |
| `<leader>hu` | Deshacer el stage del hunk |
| `<leader>hr` | Descartar el hunk con confirmación |
| `<leader>hp` | Previsualizar el hunk |
| `<leader>hb` | Mostrar blame de la línea |
| `<leader>hB` | Alternar blame permanente |
| `<leader>ht` | Alternar líneas eliminadas |
| `<leader>hd` / `<leader>hD` | Diff contra índice / HEAD |

## Mantenimiento

- `:Lazy`: administrar y actualizar plugins.
- `:Mason`: administrar servidores LSP y herramientas.
- `:MasonToolsInstall`: instalar las herramientas declaradas que falten.
- `:MasonToolsUpdate`: actualizar las herramientas declaradas.
- `:TSUpdate`: actualizar los parsers de Treesitter.
- `:ConformInfo`: inspeccionar los formateadores disponibles.
- `:HighlightColors Toggle`: activar o desactivar el resaltado de colores.
- `:TrimWhitespace`: eliminar espacios al final de las líneas del buffer.
- `:ReloadConfig`: recargar parcialmente los módulos principales.

`ReloadConfig` no equivale a reiniciar Neovim: un atajo eliminado puede seguir
activo hasta cerrar y volver a abrir el editor.
