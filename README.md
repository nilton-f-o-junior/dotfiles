<p align="center">
    <img src="img/dotfiles-logo.png">
</p>


## Ambiente

| | Arch Linux + Niri + Noctalia Shell |
|---|---|
| **Foco** | Desenvolvimento web / Geral |
| **Editores** | Helix, OpenCode |

---

### Instalação

#### 1. Conectar ao Wi-Fi (live ISO)

```bash
iwctl
station wlan0 get-networks
station wlan0 connect <nome-da-rede>
# digite a senha quando solicitado
```

#### 2. Instalar o sistema

```bash
archinstall
```

#### 3. Conectar ao Wi-Fi (pós-instalação)

```bash
nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <nome-da-rede> password <senha>
```

#### 4. Pacotes principais

```bash
sudo pacman -Syu
sudo pacman -S git helix starship eza
sudo pacman -Rsn nano htop vim fuzzel rofi swaybg swayidle swaylock waybar
```

```bash
sudo pacman -S nerd-fonts
```

> **Fontes Nerd Fonts:** JetBrains Mono (44) + Nerd Font Icons (54)

#### 5. AUR (yay)

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

#### 6. AUR (paru)

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
```

#### 7. Aplicativos (AUR)

```bash
paru -S google-chrome
paru -S aseprite
paru -S wezterm-nightly-bin
```

#### 8. Noctalia Shell

```bash
paru -S noctalia-shell
qs -c noctalia-shell
```

#### 9. Firewall

```bash
sudo ufw enable
```

#### 10. Rust

```bash
sudo pacman -Rns rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### 11. Starship

```bash
helix ~/.bashrc
eval "$(starship init bash)"
```

#### 12. Eza

```bash
helix ~/.bashrc
alias ls='eza --icons=always --color=always'
alias ll='eza -la --icons=always --git'
alias lt='eza --tree --icons=always'
source ~/.bashrc
```

#### 13. Git & SSH

```bash
git config --global user.name "seu-nome"
git config --global user.email "seu@email.com"

ssh-keygen -t ed25519 -C "seu@email.com"

# Copiar chave pública
cat ~/.ssh/id_ed25519.pub
# GitHub → Settings → SSH and GPG keys → New SSH key → colar → Add
```

#### 14. Bluetooth

```bash
sudo systemctl enable --now bluetooth.service
bluetoothctl
```

```
power on
agent on
default-agent
scan on
devices
trust <device-id>
pair <device-id>
connect <device-id>
```

#### 15. Menu de Aplicativos

```bash
mkdir -p ~/.local/share/applications

# copiar todos os arquivos .desktop (incluindo o lstopo)
cp /usr/share/applications/cmake-gui.desktop    /usr/share/applications/avahi-discover.desktop    /usr/share/applications/bssh.desktop    /usr/share/applications/bvnc.desktop    /usr/share/applications/nm-connection-editor.desktop    /usr/share/applications/qv4l2.desktop    /usr/share/applications/qvidcap.desktop    /usr/share/applications/lstopo.desktop    ~/.local/share/applications/

# loop para ocultar os aplicativos adicionando NoDisplay=true
for f in cmake-gui avahi-discover bssh bvnc nm-connection-editor qv4l2 qvidcap lstopo; do
  echo -e "\nNoDisplay=true" >> ~/.local/share/applications/$f.desktop
done

update-desktop-database ~/.local/share/applications
```

#### 16. Nautilus

```bash
# install
sudo pacman -S xdg-desktop-portal-gtk

# conf
# ~/.config/xdg-desktop-portal/portals.conf
# [preferred]
# default=gtk
# org.freedesktop.impl.portal.FileChooser=gtk

# dbus
mkdir -p ~/.local/share/dbus-1/services/
ln -s /dev/null ~/.local/share/dbus-1/services/org.freedesktop.FileManager1.service

# remove
sudo pacman -R xdg-desktop-portal-gnome nautilus

# verifica
sudo pacman -S --needed xdg-desktop-portal-gtk

# reinicia
systemctl --user restart xdg-desktop-portal
```
