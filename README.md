<!-- Arch -->
## Install

1. Connect wifi
    a. iwctl
    b. station wlan0 get-networks
    c. station wlan0 connect <name> + enter
    d. <password>

2.  archinstall
3.  Preference Config  ...


## Connect

nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <name> password <password>


## Programs

sudo pacman -Syu
sudo pacman -S git alacritty docker h ufw
sudo pacman -Rsn vim foot waybar nano grim htop

sudo pacman -S nerd-fonts
<!--(JetBrains (42) + Nerd Font Icons (53))-->

## Rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


## UFW - Firewall

sudo ufw enable


## Bluetooth

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
bluetoothctl

power on
agent on
default-agent
scan on
devices
trust <code name - reference to device>
pair <code name - reference to device>
connect <code name - reference to device>


## Starship

helix ~/.bashrc
eval "$(starship init bash)"


## Git

1. git config --global user.name "name"
2. git config --global user.email "@email"
3. ssh-keygen -t ed25519 -C "your_email@example.com"
4. enter ... enter
5. cd > cd .ssh/ > acess id_ed25519.pub
6. cat id_ed25519.pub
7. copy > github > settings > SSH and GPG keys > new SSH > paste > add
8. github > create repository > copy > SSH git@github.com: ... > paste git clone git@github.com: ... > yes


## Yay

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S google-chrome
yay -S aseprite


## Pavucontrol

sudo pacman -S gnome-themes-extra
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
