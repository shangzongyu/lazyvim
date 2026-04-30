# LazyVim

This is my LazyVim config.

```sh
git clone https://github.com/shangzongyu/lazyvim.git $HOME/.config/nvim
```

## AI

This config uses `yetone/avante.nvim`.

Current provider config:

- Provider: `openai`
- Model: `gpt-4o`
- Endpoint: `https://api.openai.com/v1`
- Env var: `OPENAI_API_KEY`

Before using AI, make sure `OPENAI_API_KEY` is available in the shell that launches Neovim.

Common AI shortcuts:

- `<leader>aa`: `AvanteAsk`
- `<leader>ac`: `AvanteChat`
- `<leader>ae`: `AvanteEdit`
- `<leader>af`: `AvanteFocus`
- `<leader>ah`: `AvanteHistory`
- `<leader>am`: `AvanteModels`
- `<leader>ap`: `AvanteSwitchProvider`
- `<leader>ar`: `AvanteRefresh`
- `<leader>as`: `AvanteStop`
- `<leader>at`: `AvanteToggle`

Equivalent commands:

- `:AvanteAsk`
- `:AvanteChat`
- `:AvanteEdit`
- `:AvanteToggle`
- `:AvanteModels`

Typical usage:

- Ask about current code: `<leader>aa`
- Open chat sidebar: `<leader>ac`
- Let AI edit code: visual select + `:AvanteEdit`
- Switch model/provider: `<leader>am` / `<leader>ap`
