#!/bin/bash

set -eux

USERDIR="$HOME/.config/Code"

#rm -rf ${USERDIR};exit

mkdir -p ${USERDIR}/User/

if [[ ! -e "${USERDIR}/User/settings.json" ]]; then
cat >${USERDIR}/User/settings.json <<EOF
{
    "security.workspace.trust.untrustedFiles": "open",
    "git.openRepositoryInParentFolders": "always",
    "telemetry.telemetryLevel": "off",
    "window.zoomLevel": 1.0,
    "git.confirmSync": false,
    "git.autofetch": true,
    "gitlens.telemetry.enabled": false,
}
EOF
fi

VSCODE="code"
VSCODE="${VSCODE} --extensions-dir ${HOME}/.cache/vsexternsion/"
VSCODE="${VSCODE} --locale en-US"
VSCODE="${VSCODE} --user-data-dir ${USERDIR}"
#VSCODE="${VSCODE} --profile SOMEPROFILE"
VSCODE="${VSCODE} --reuse-window"

${VSCODE} --install-extension Dart-Code.flutter
${VSCODE} --install-extension ms-vscode.cpptools
${VSCODE} --install-extension ms-vscode.cpptools-extension-pack
${VSCODE} --install-extension ms-vscode-remote.vscode-remote-extensionpack
${VSCODE} --install-extension ms-python.python
${VSCODE} --install-extension ms-python.vscode-pylance
${VSCODE} --install-extension ms-python.isort
${VSCODE} --install-extension dbaeumer.vscode-eslint
${VSCODE} --install-extension eamodio.gitlens
${VSCODE} --install-extension GitHub.copilot
${VSCODE} --install-extension vscjava.vscode-java-pack

${VSCODE} "${@:-}"
#${VSCODE} --add .
#${VSCODE} --goto vscode.sh


# https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf
#
# ctrl + shift + P
# opensshremotes.openEmptyWindow
#
# keyboard shortcuts: Ctrl + K, Ctrl + S
#
#
# remote run example:
# ./vscode.sh --folder-uri vscode-remote://ssh-remote+home_host/some/remote/directory
#
# Ctrl + , = open settings
# telemetry -> off
#
# Ctrl+p or ctrl+e find a file
# cttl+shift+d - debug
