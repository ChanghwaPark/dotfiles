# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Setup (new machine)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ChanghwaPark
```

chezmoi will prompt for:
- **email**: your git email address
- **isDesktop** (Linux only): whether this is a desktop machine with GUI

After applying, create `~/.zshrc.local` with machine-specific settings (not tracked by chezmoi):

```bash
# Example ~/.zshrc.local
source <(kubectl completion zsh)
export AWS_SESSION_DURATION=43200
# ... conda init, gcloud SDK, secrets, etc.
```

## What's managed

| Config | Target |
|---|---|
| zsh | `~/.zshrc` (template) |
| tmux | `~/.tmux.conf.local` + `~/.tmux/` (gpakosz/.tmux via external) |
| neovim (NvChad) | `~/.config/nvim/` |
| starship | `~/.config/starship.toml` |
| ghostty | `~/.config/ghostty/config` (macOS + Linux desktop only) |
| yazi | `~/.config/yazi/` |
| sesh | `~/.config/sesh/sesh.toml` |
| karabiner | `~/.config/karabiner/karabiner.json` (macOS only) |
| ruff | `~/.config/ruff/ruff.toml` |

## Day-to-day usage

```bash
# Edit a tracked file
chezmoi edit ~/.zshrc

# See pending changes
chezmoi diff

# Apply changes
chezmoi apply

# Re-capture a file you edited directly
chezmoi add ~/.config/starship.toml

# Update chezmoi source from remote
chezmoi update
```

## Notes

- **`~/.zshrc.local`**: machine-specific settings (kubectl, conda, gcloud, secrets). Not managed by chezmoi.
- **karabiner**: Karabiner auto-modifies its JSON. Run `chezmoi add ~/.config/karabiner/karabiner.json` after making changes in the UI.
- **NvChad**: plugins are managed by lazy.nvim, not git. `~/.config/nvim/.git` is removed by the bootstrap script.
- **Secrets**: never commit SLACK tokens or similar. Keep them in `~/.zshrc.local` only.
