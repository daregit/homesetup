#!/bin/bash
set -euo pipefail



CONFIG="$HOME/.config/pikaur.conf"

mkdir -p "$(dirname "$CONFIG")"

if [[ ! -f "$CONFIG" ]]; then
    pikaur --dump-config > "$CONFIG" 2>/dev/null || touch "$CONFIG"
fi

set_option() {
    local section="$1"
    local key="$2"
    local value="$3"

    if ! grep -q "^\[$section\]" "$CONFIG"; then
        echo -e "\n[$section]" >> "$CONFIG"
    fi

    if grep -q "^[[:space:]]*$key[[:space:]]*=" "$CONFIG"; then
        sed -i "/^\[$section\]/,/^\[/ s/^[[:space:]]*$key[[:space:]]*=.*/$key = $value/" "$CONFIG"
    else
        sed -i "/^\[$section\]/a $key = $value" "$CONFIG"
    fi
}

set_option "review" "noedit" "yes"
set_option "review" "donteditbydefault" "yes"
set_option "review" "nodiff" "yes"
set_option "review" "diff" "no"
set_option "review" "edit" "no"

set_option "sync" "noconfirm" "yes"

#if ! id pikaur &>/dev/null; then
#    sudo useradd -m -r -s /bin/false pikaur
#fi
#set_option "build" "dynamicusers" "never"
#set_option "build" "UserId" $(id -u pikaur)
#set_option "build" "GroupId" $(id -g pikaur)

