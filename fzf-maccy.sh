#!/usr/bin/env bash

set -eu -o pipefail

DB=~/Library/Containers/org.p0deje.Maccy/Data/Library/Application\ Support/Maccy/Storage.sqlite
SQL="select   distinct ZVALUE
     from     ZHISTORYITEMCONTENT
     where    ZTYPE IN ('public.text','public.utf8-plain-text')
     order by Z_PK desc"

if ! [ -r "$DB" ]; then
  MSG='Maccy database not found. "brew cask install maccy" to install Maccy.'
  if [ -n "${TMUX:-}" ]; then
    tmux display-message -d 0 "$MSG"
  else
    >&2 echo "$MSG"
  fi
  exit 1
fi

SEP=$(head -128 /dev/urandom | shasum)
SEP=${SEP::8}
sqlite3 -newline "$SEP" "$DB" "$SQL" |
  perl -pe "s/$SEP/\\x0/g" |
  fzf-tmux "$@" -- --read0 --layout=reverse --multi --prompt='Maccy> ' --tiebreak=index |
  perl -pe 'chomp if eof' |
  pbcopy
