#!/usr/bin/env bash

output=$(nix-build)

hilite() {
    REGEX_SED=$(echo $1 | sed "s/[|()]/\\\&/g");
    sed "s/$REGEX_SED/\x1b[7m&\x1b[0m/g"
}

if grep -q "error" <<< "$output"; then
  echo "Error during build!"
  echo "$output" | hilite "error" | hilite "{" | hilite "}" | hilite ";" | hilite "^" | hilite "In"
  exit 1
else
  ./result/bin/main.app
fi
