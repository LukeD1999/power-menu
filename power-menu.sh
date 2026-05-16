#!/usr/bin/bash

main() {
	local list=(
		"Shutdown "
		"Reboot "
		"Logout "
		"Suspend "
	)

	local options=(
		"--border=sharp"
		"--border-label= Power Menu "
		"--cycle"
		"--pointer=> "
		"--no-input"
		"--layout=reverse-list"
		"--padding=2,5"
		"--bind=k:up"
		"--bind=j:down"
		"--no-height"
		"--no-list-border"
		"--marker="
		"--highlight-line"
		"--style=minimal"
		"--bind=q:abort"
	)	

	local selected
	selected=$(printf "%s\n" "${list[@]}" | fzf "${options[@]}")

	case $selected in
		Shutdown*)  shutdown now ;;
		Reboot*)    systemctl reboot ;;
		Logout*)    loginctl terminate-user $USER ;;
		Suspend*)   systemctl suspend ;;
		*)         exit 1 ;;
	esac
}

main
