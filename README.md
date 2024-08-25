# Neovim configuration for presentation slides

Running following plugins at its core:

- folke/zen-mode.nvim
- nvim-neorg/neorg
- 3rd/image.nvim
- jbyuki/venn.nvim

lazy.nvim as plugin manager makes it easier to install luarock dependencies
for neorg.nvim and image.nvim.

## Installation
External dependency:
[toilet](https://github.com/cacalabs/toilet)

We make use of NVIM_APPNAME to change the configuration directory.
Follow the [neovim instructions](https://neovim.io/doc/user/starting.html)
(search for NVIM_APPNAME) how to set it up correctly on your OS.

Clone the repository to $XDG_CONFIG_HOME.
You should end up with at least two config diretories, your personal and this one
$XDG_CONFIG_HOME/nvim-slides.

Afterwards you can launch neovim as follows, to load the nvim-slides configuration
(considering, you haven't renamed the cloned repo):
```bash

   NVIM_APPNAME=nvim-slides nvim
```

### Terminal emulator

Only tested with kitty terminal emulator. kitty should work
best, since image.nvim works best with kitty as backend out of the box.
Other terminal emulators might work, but need additional configuration.

### Colorscheme

Can be ignored for the most part. Colors are hardcoded so we get white slides
with dark text.

### Coloring of text on slides

Only the hacky way defining a syntax file for norg filetype and match specific
words via regexp. Although was struggling to get generic rules for image paths
to work. Then add highlight groups to the matches to be applied.
There should be a better way to do this..

## WIP
- make the config more generic for others to use and easier to configure in general
- solve coloring of text on slides
- issue with image.nvim and zen-mode.nvim, where image of one slide, is displayed
  on all other slides aswell
