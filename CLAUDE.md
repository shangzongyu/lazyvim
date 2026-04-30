
This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

LazyVim-based Neovim configuration. No build or test commands — this is a pure config directory that Neovim loads at startup.

## Code Formatting

Lua files must be formatted with **StyLua** (4-space indent, 120 column width per `stylua.toml`):

```sh
stylua lua/
```

## Architecture

- `init.lua` — entry point, loads `lua/config/lazy.lua`
- `lua/config/lazy.lua` — bootstraps `lazy.nvim`, imports `lazyvim.plugins` and the local `lua/plugins/` spec
- `lazyvim.json` — controls which LazyVim extras are enabled (edit this to add/remove language packs)
- `lua/plugins/` — all custom plugin specs returned as Lua tables; each file is auto-imported by lazy.nvim

## Plugin Conventions

Custom plugins in `lua/plugins/` follow the lazy.nvim spec pattern:

```lua
return {
  { "plugin/name", opts = { ... } },
  { "neovim/nvim-lspconfig", opts = { servers = { ... }, setup = { ... } } },
}
```

- Extend LazyVim defaults via `opts = function(_, opts) ... end` — do not replace wholesale.
- `setup` table in nvim-lspconfig opts is for post-setup hooks (return `false` to skip default setup, `true` to skip lazy.nvim's setup).

## Key Files

| File | Purpose |
|------|---------|
| `lua/plugins/lsp.lua` | All LSP server configs (clangd, gopls, pyright+ruff_lsp, rust_analyzer, tsserver) + DAP adapters |
| `lua/plugins/colorscheme.lua` | Active colorscheme: `token` (ThorstenRhau/token); gruvbox also available |
| `lua/plugins/wakatime.lua` | Wakatime integration |
| `lua/config/options.lua` | Neovim options extending LazyVim defaults |
| `lua/config/autocmds.lua` | Custom autocommands |

## Language-Specific Notes

- **C/C++**: clangd with `--clang-tidy`, `--header-insertion=iwyu`; `<leader>cR` switches source/header; debugger: codelldb
- **Go**: gopls with gofumpt, staticcheck, full inlay hints; `<leader>td` debug nearest test
- **Python**: pyright (types) + ruff_lsp (lint/format); ruff_lsp hover disabled in favor of pyright; `<leader>cv` selects virtualenv
- **Rust**: rust-analyzer via rust-tools.nvim; clippy on save; `<leader>cR/ct/cd` for runnables/hover/debuggables
- **TypeScript**: tsserver via typescript.nvim; prettier + eslint_d via none-ls; formatting delegated to prettier (LSP formatting disabled)
