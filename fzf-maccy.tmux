#!/usr/bin/env bash

script=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/fzf-maccy.sh

conf() {
  local value
  value=$(tmux show -gqv "$1")
  [ -n "$value" ] && echo "$value" || echo "$2"
}

key="$(conf @fzf-maccy-bind @)"

tmux_version=$(tmux -V | sed 's/[^0-9]*//' | awk -F. '{ printf("%d%03d\n", $1, $2); }')
(( tmux_version >= 3002 )) &&
  default_layout=-p70% ||
  default_layout=-d

layout=$(conf @fzf-maccy-layout "$default_layout")
tmux bind-key "$key" run -b "$script $layout || :";
