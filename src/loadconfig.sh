if [ -v options ]; then
	if [ "$(typeset -p options)" != "declare -A options" ]; then
		echo "$0: internal error, 'options' is badly typed" >&2
		exit 1
	fi
fi

[ ! -v CONFIG ] && CONFIG="/etc/sbtools.conf"

declare -A default_options
declare -A options
default_options=(
	[efistub]="/usr/lib/systemd/boot/efi/linuxx64.efi.stub"
	[osrel]="/etc/os-release"
	[compress]="gzip"
	[keysdir]="/etc/efi-keys"
)

if [ -f "$CONFIG" ]; then
	while read line
	do
		NAME=$(echo "$line" | cut -d '=' -f 1)
		if [ -n "$NAME" ] && [ ${NAME:0:1} != '#' ] && [ -z "${options[${NAME}]}" ]; then
			options[${NAME}]=$(echo "$line" | cut -d '=' -f 2-)
		fi
	done < $CONFIG
fi

for k in "${!default_options[@]}"
do
	if [ -z "${options[${k}]+x}" ]; then
		options[${k}]="${default_options[${k}]}"
	fi
done
