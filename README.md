tmux-fzf-maccy
==============

[Tmux][tmux] plugin for [Maccy][maccy] and [fzf][fzf] integration. Allows you
to select an entry from clipboard history.

[tmux]: https://github.com/tmux/tmux
[fzf]: https://github.com/junegunn/fzf
[maccy]: https://github.com/p0deje/Maccy

Prerequisites
-------------

- [tmux][tmux]
    - Popup window is used if you have tmux 3.2 or above
- [fzf][fzf]
    - `fzf-tmux` should be on `$PATH`
- [Maccy][maccy]

Installation
------------

### Using [TPM](https://github.com/tmux-plugins/tpm)

Add this line to your tmux config file and press `PREFIX` + `I`.

```sh
set -g @plugin 'junegunn/tmux-fzf-maccy'
```

Usage
-----

Press `PREFIX` + `@` and select an entry to copy to your clipboard.

Customization
-------------

```sh
# Bind-key (default: '@')
set -g @fzf-maccy-bind '@'

# fzf-tmux layout (default: '-p70%' on tmux 3.2, '-d' otherwise)
#   (-p requires tmux 3.2 or above, see `man fzf-tmux` for available options)
set -g @fzf-maccy-layout '-p70%'
```

License
-------

[MIT](/LICENSE)
