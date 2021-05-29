source "$HOME/.cargo/env"
source "$HOME/.dbus/session-bus/$(cat /var/lib/dbus/machine-id)-${DISPLAY:1}"
export DBUS_SESSION_BUS_ADDRESS

