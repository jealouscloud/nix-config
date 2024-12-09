#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

rsync --exclude='*.backup' -avP --copy-links --delete ~/.local/share/konsole/ ${SCRIPT_DIR}/konsole/
cp ~/.config/kglobalshortcutsrc ${SCRIPT_DIR}/