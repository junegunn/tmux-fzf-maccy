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
- [fzf][fzf]
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

# Popup window orientation and size (default: '70%', uses '--tmux' option of fzf)
set -g @fzf-maccy-popup '70%'
```

License
-------

[MIT](/LICENSE)
