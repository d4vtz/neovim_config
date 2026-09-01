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
- Soporte configurado para Lua, Python, C, C++, Bash y LaTeX.

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
- una Nerd Font
- `ripgrep` y `fd`, recomendados para Telescope

Herramientas externas según el lenguaje:

- Lua: `stylua`
- Python: `ruff`
- C y C++: `clang-format`
- LaTeX: `latexmk`, `latexindent` y `zathura`

Los servidores de lenguaje se administran desde `:Mason`.

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
| `<leader>e` | Abrir o cerrar Neo-tree |
| `<leader>cf` | Formatear el buffer |
| `<leader>xx` | Mostrar diagnósticos |
| `<C-\\>` | Abrir una terminal flotante |
| `<S-h>` / `<S-l>` | Buffer anterior / siguiente |

## Mantenimiento

- `:Lazy`: administrar y actualizar plugins.
- `:Mason`: administrar servidores LSP.
- `:TSUpdate`: actualizar los parsers de Treesitter.
- `:ConformInfo`: inspeccionar los formateadores disponibles.
- `:ReloadConfig`: recargar parcialmente los módulos principales.

`ReloadConfig` no equivale a reiniciar Neovim: un atajo eliminado puede seguir
activo hasta cerrar y volver a abrir el editor.
