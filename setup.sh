#!/bin/bash

set -e

git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.df diff
git config --global alias.lg log

git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

git config --global merge.tool kdiff3

git config --global gui.spellingdictionary en_GB

git config --global push.default tracking
git config --global push.autoSetupRemote true

git config --global fetch.prune true

git config --global http.cookiefile ~/.gitcookies
git config --global am.threeWay true
git config --global rebase.autoStash true
