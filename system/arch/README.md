# arch - niri

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
sudo pacman -S git helix htop fuzzel rofi vim starship swaybg swayidle swaylock waybar
sudo pacman -Rsn nano htop foot wmenu vim

sudo pacman -S nerd-fonts
# JetBrains (44) + Nerd Font Icons (54)
```

`yay`

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S google-chrome
yay -S aseprite
```

`paru`

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
```

`noctalia`

```bash
paru -S noctalia-shell
qs -c noctalia-shell
```

`firefox`

```bash
helix ~/.config/user-dirs.dirs

XDG_DESKTOP_DIR="$HOME"
XDG_DOWNLOAD_DIR="$HOME/down"
XDG_TEMPLATES_DIR="$HOME"
XDG_PUBLICSHARE_DIR="$HOME"
XDG_DOCUMENTS_DIR="$HOME"
XDG_MUSIC_DIR="$HOME"
XDG_PICTURES_DIR="$HOME"
XDG_VIDEOS_DIR="$HOME"
```

`ufw`

```bash
sudo ufw enable
```

`rust`

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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
github > create repository > copy > SSH git@github.com: ... > paste git clone git@github.com: ... > yes
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

`Criar a pasta local`

```bash
mkdir -p ~/.local/share/applications

# copiar todos os arquivos .desktop
cp /usr/share/applications/cmake-gui.desktop \
   /usr/share/applications/avahi-discover.desktop \
   /usr/share/applications/bssh.desktop \
   /usr/share/applications/bvnc.desktop \
   /usr/share/applications/nm-connection-editor.desktop \
   /usr/share/applications/qv4l2.desktop \
   /usr/share/applications/qvidcap.desktop \
   ~/.local/share/applications/

#
for f in cmake-gui avahi-discover bssh bvnc nm-connection-editor qv4l2 qvidcap; do
  echo -e "\nNoDisplay=true" >> ~/.local/share/applications/$f.desktop
done
```
