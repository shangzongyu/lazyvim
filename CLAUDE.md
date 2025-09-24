# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository。

## Overview

This is a LazyVim Neovim configuration directory。It's designed to be placed at `$HOME/.config/nvim` and provides a customized Neovim setup with LazyVim as the base configuration。

## Installation

To install this configuration：

```sh
git clone https://github.com/shangzongyu/lazyvim.git $HOME/.config/nvim
```

## Configuration Structure

- `init.lua` - Entry point that loads the main configuration from `config.lazy`
- `lua/config/` - Core configuration files：
  - `lazy.lua` - LazyVim bootstrap and plugin manager setup
  - `options.lua` - Neovim options (currently minimal，extends LazyVim defaults)
  - `keymaps.lua` - Custom key mappings
  - `autocmds.lua` - Custom autocommands
- `lua/plugins/` - Plugin-specific configurations：
  - `lsp.lua` - Language Server Protocol configurations for multiple languages
  - `colorscheme.lua` - Color scheme configuration
  - `wakatime.lua` - Wakatime integration

## Development Commands

### Code Formatting

This configuration uses **StyLua** for Lua code formatting。The style configuration is in `stylua.toml`：
- Indentation：4 spaces
- Column width：120 characters

### Plugin Management

- Plugins are managed by `lazy.nvim` (configured in `lua/config/lazy.lua`)
- Plugin configurations are in the `lua/plugins/` directory
- The configuration includes numerous LazyVim extras for different languages and tools

## Language Support

The configuration includes comprehensive language support through LazyVim extras：

### Core Languages

- **C/C++** - clangd with extensions，DAP debugging support
- **Go** - gopls with full language features，debugging support
- **Python** - pyright + ruff_lsp，virtual environment support，debugging
- **Rust** - rust-analyzer
- **TypeScript/JavaScript** - tsserver
- **Many others** - See `lazyvim.json` for complete list

### AI Integration

### Debugging

- DAP (Debug Adapter Protocol) configured for C/C++, Go，Python
- Tools：codelldb，debugpy

## Key Features

### LSP Configuration (`lua/plugins/lsp.lua`)

- Multi-language support with language-specific settings
- Custom root directory detection for C/C++ projects
- Enhanced clangd configuration with inlay hints and AST display
- Go development with gopls and comprehensive analysis
- Python with pyright + ruff_lsp combination
- Virtual environment selector for Python

### Plugin Management

- Uses lazy loading for optimal performance
- Automatic plugin updates enabled
- Custom plugin configurations extend LazyVim defaults

### Editor Features

- Symbols outline for code navigation
- Enhanced completion with clangd extensions
- Git integration
- AI-powered code assistance

## File Structure

```
~/.config/lazyvim/
├── init.lua                    # Main entry point
├── lazyvim.json               # LazyVim extras configuration
├── lazy-lock.json             # Plugin lock file
├── stylua.toml               # Lua formatter configuration
├── lua/
│   ├── config/
│   │   ├── lazy.lua         # Plugin manager setup
│   │   ├── options.lua      # Neovim options
│   │   ├── keymaps.lua      # Custom keymaps
│   │   └── autocmds.lua     # Custom autocommands
│   └── plugins/
│       ├── lsp.lua          # LSP configurations
│       ├── colorscheme.lua   # Theme settings
│       └── wakatime.lua      # Wakatime integration
```

## Notes

- This is a user-specific Neovim configuration，not a standalone project
- All functionality depends on LazyVim being properly installed
- Plugin configurations follow LazyVim patterns and extend base functionality
- No build/test commands are needed - this is a configuration directory
