#!/bin/bash
OS_KERNEL=$(uname -s)
if [ "$OS_KERNEL" = "Darwin" ]; then
	OS_NAME="MacOS"
elif [ -f /etc/fedora-release ]; then
	OS_NAME="Fedora"
else
	OS_NAME="Unknown"
fi

echo -e "[\033[0;32mINFO\033[0m] $OS_NAME $OS_KERNEL"

export OS_NAME
export OS_KERNEL

if [ "$OS_NAME" = "Fedora" ]; then
	echo -e "[\033[0;32mINFO\033[0m] update dnf"
	sudo dnf -y update
fi

for SCRIPT in $(find . -name "install.sh" -print | grep -v "\.\/install.sh"); do
	echo ""
	sh $SCRIPT
done
