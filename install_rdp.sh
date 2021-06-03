sudo apt update && sudo apt install -y xrdp
sudo systemctl enable --now xrdp
sudo ufw allow from any to any port 3389 proto tcp

# use same desktop in rdp
cat <<EOF > ~/.xsessionrc
export GNOME_SHELL_SESSION_MODE=ubuntu
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
EOF