grep -qF -- "fastestmirror=1" "/etc/dnf/dnf.conf" || echo "fastestmirror=1" >> "/etc/dnf/dnf.conf"
grep -qF -- "max_parallel_downloads=10" "/etc/dnf/dnf.conf" || echo "max_parallel_downloads=10" >> "/etc/dnf/dnf.conf"
grep -qF -- "deltarpm=true" "/etc/dnf/dnf.conf" || echo "deltarpm=true" >> "/etc/dnf/dnf.conf"

dnf upgrade -y

dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf install gsettings-desktop-schemas arc-theme papirus-icon-theme sway wofi waybar swayidle swaylock pulseaudio-utils playerctl pavucontrol NetworkManager-tui udiskie wl-clipboard clipman htop ImageMagick ansible git zip net-tools pwgen qrencode openconnect chromium telegram-desktop mpv remmina -y

LocalUsername="user"
GitUsername="radtkedev"
GitEmail="mail@radtke.dev"

git config --global init.defaultBranch "master"
git config --global user.name $GitUsername
git config --global user.email $GitEmail

cat <<EOT > /home/$LocalUsername/.bashrc
HISTCONTROL=ignorespace
PS1="[Bash] \W > "
alias pw=" pwgen -s 64 | tr -d '\n' | clipman"
alias qr=" qrencode -t ANSI256"
EOT
chown $LocalUsername:$LocalUsername /home/$LocalUsername/.bashrc

cat <<EOT > /home/$LocalUsername/.bash_profile
. .bashrc
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
EOT
chown $LocalUsername:$LocalUsername /home/$LocalUsername/.bash_profile

mkdir -p /etc/systemd/system/getty@tty1.service.d/
cat <<EOT > /etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/usr/sbin/agetty --autologin $LocalUsername --noclear %I $TERM
EOT

#gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
#gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag false
#gsettings set org.gnome.desktop.peripherals.mouse accel-profile adaptive
#gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker"
#gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
