#!/usr/bin/env bash

script=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/fzf-maccy.sh

conf() {
  local value
  value=$(tmux show -gqv "$1")
  [ -n "$value" ] && echo "$value" || echo "$2"
}

key="$(conf @fzf-maccy-bind @)"

popup=$(conf @fzf-maccy-popup "70%")
tmux bind-key "$key" run -b "$script \"$popup\" || :";
