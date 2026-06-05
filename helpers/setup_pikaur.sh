#!/bin/bash

set -euo pipefail

CONFIG="$HOME/.config/pikaur.conf"

mkdir -p "$(dirname "$CONFIG")"

if [[ ! -f "$CONFIG" ]]; then
    pikaur --dump-config > "$CONFIG" 2>/dev/null || touch "$CONFIG"
fi

set_option() {
    local key="$1"
    local value="$2"
    if grep -q "^[[:space:]]*$key[[:space:]]*=" "$CONFIG"; then
        sed -i "s/^[[:space:]]*$key[[:space:]]*=.*/$key = $value/" "$CONFIG"
    else
        echo "$key = $value" >> "$CONFIG"
    fi
}

set_option "noedit" "yes"
set_option "donteditbydefault" "yes"
set_option "nodiff" "yes"
set_option "noconfirm" "yes"
set_option "diff" "no"
set_option "edit" "no"
