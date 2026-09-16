# AGENTS.md

- This repository deals with personal "dotfiles" for the NeoVim text editor
- NEVER create git commits unless explicitly asked to
- NEVER manually edit the lazy lock file `lazy-lock.json`, this is managed by
  the Lazy plugin manager

The Lazy Plugin Manager repository is located at:
https://github.com/folke/lazy.nvim
With documentation at:
https://lazy.folke.io/

It is possible to run NeoVim commands from the command line using
`nvim --headless`

For example:

```sh
# Sync plugins
nvim --headless "+Lazy! sync" +qa
# Each + is a command to send to nvim
# Lazy! here makes the Lazy command wait to complete
# qa will send the command to quit all
```

You will likely want to add `+q` or `+qa` to end of all headless commands
otherwise the `nvim` instance will continue running.

## Lazy Commands

Common Lazy commands are:

- `Lazy help` - Will display Lazy help
- `Lazy health` - Will run `:checkhealth lazy`
- `Lazy build` - Will build a plugin or all plugins
- `Lazy update` - Will update plugins
- `Lazy install` - Will install plugins
- `Lazy clean` - Will remove no longer needed plugins
- `Lazy sync` - Will run clean, install, and update

Most of these can have a plugin or list of plugins as optional parameters.
