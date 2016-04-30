#!/bin/sh
# Installs ssh-copy-id
# Usage:
# install.sh [-u | -h | -o | -s]
# Options:
# -u	Install into /usr/local/bin (DEFAULT)
# -h	Install into $HOME/bin
# -o	Install into /opt/local/bin
# -s	Install into /usr/bin

installpath=/usr/local
if [ "$1" == "-h" ]; then
	installpath="$HOME"
fi
if [ "$1" == "-o" ]; then
	installpath=/opt/local
fi
if [ "$1" == "-s" ]; then
	installpath=/usr
fi

if [ "$installpath" != "$HOME" ] && [[ $(id -u) != 0 ]]; then
	if command -v sudo >/dev/null 2>&1; then
		SUDO="sudo"
	else
		echo >&2 "Requires sudo but it's not installed. Aborting."
		exit 1
	fi
fi

if git ls-files >& /dev/null &&  [[ -f ssh-copy-id.sh ]]; then
	$SUDO cp ssh-copy-id.sh "$installpath"/bin/ssh-copy-id || { echo "Failed to install ssh-copy-id into $installpath/bin."; exit 1; }
else
	$SUDO curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/ssh-copy-id.sh -o "$installpath"/bin/ssh-copy-id || { echo "Failed to install ssh-copy-id into $installpath/bin."; exit 1; }
	$SUDO chmod +x "$installpath"/bin/ssh-copy-id || { echo "Failed to install ssh-copy-id into $installpath/bin."; exit 1; }
fi
echo "Installed ssh-copy-id into $installpath/bin."; exit 0;
