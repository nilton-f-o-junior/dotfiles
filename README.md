<!-- Arch -->

`install`

```bash
# Connect wifi
iwctl
station wlan0 get-networks
station wlan0 connect <name> + enter
<password>

# install
archinstall
```

`connect`

```bash
nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <name> password <password>
```

`programs`

```bash
sudo pacman -Syu
sudo pacman -S git alacritty docker ufw
sudo pacman -Rsn nano grim htop

sudo pacman -S nerd-fonts
# JetBrains (42) + Nerd Font Icons (53)
```

`rust`

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

`ufw`

```bash
sudo ufw enable
```

`bluetooth`

```bash
# config
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
bluetoothctl

# init
power on
agent on
default-agent
scan on
devices
trust <code name - reference to device>
pair <code name - reference to device>
connect <code name - reference to device>
```

`starship`

```bash
helix ~/.bashrc
eval "$(starship init bash)"
```

`git`

```bash
# config
git config --global user.name "name"
git config --global user.email "@email"
ssh-keygen -t ed25519 -C "your_email@example.com"

# enter ... enter

cd
cd .ssh/ > acess id_ed25519.pub
more id_ed25519.pub

# git
# copy > github > settings > SSH and GPG keys > new SSH > paste > add
# github > create repository > copy > SSH git@github.com: ... > paste git clone git@github.com: ... > yes
```

`yay`

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S google-chrome
yay -S aseprite
```
