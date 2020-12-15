read -p 'Username: ' uservar

#Update and then install new packages
apt update && sudo apt upgrade -y

sudo apt install steam keepassxc pithos git bleachbit fish nmap python3-pip \\
wireguard gsconnect gnome-shell-extension-impatience mpv thunderbird profile-sync-daemon --no-upgrade -y

#Remove unwanted packages
apt remove gnome-orca

apt autoremove -y

#Install snaps
snap install bitwarden
snap install codium --classic
snap install telegram-desktop

#Change some default Gnome settings
gsettings set org.gtk.Settings.FileChooser clock-format '12h'
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 44
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-transparent-background true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-transparency-percent 20

#Aliases
alias update="sudo apt update && sudo apt upgrade -y"
alias ssh1="*Local IP Address*"
alias ssh2="*Local IP Address*"

#Profile Sync Daemon
psd
echo "Browsers=Firefox" >> /home/$uservar/.config/psd/psd.conf
echo "USE_OVERLAYFS='yes'" >> /home/$uservar/.config/psd/psd.conf

#Change shell to Fish
usermod -s /usr/bin/fish $uservar

ufw enable

echo "Please reboot or log out to enable all changes."
