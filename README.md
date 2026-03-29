<p align="center">
	<img src="img/dotfiles-logo.png">
</p>


## Ambientes

| | Arch Linux + Sway | NixOS + Niri |
|---|---|---|
| **Foco** | Desenvolvimento web | Baixo nível |
| **Editores** | Helix, Zed, VSCode | Helix |
| **Extras** | Node.js, Python, Chrome, Aseprite | Rust |

---

## Arch Linux + Sway

Ambiente completo para desenvolvimento web com múltiplos editores e ferramentas de frontend/backend.

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
sudo pacman -S alacritty git helix rofi ufw starship nerd-fonts
sudo pacman -Rsn nano htop foot wmenu vim
```
> **Fontes Nerd Fonts:** JetBrains Mono (44) + Nerd Font Icons (54)

#### 5. AUR (yay)

```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

```bash
yay -S google-chrome
yay -S aseprite
```

#### 6. Firewall

```bash
sudo ufw enable
```

#### 7. Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### 8. Starship

```bash
# Adicionar ao ~/.bashrc
eval "$(starship init bash)"
```

#### 9. Git & SSH

```bash
git config --global user.name "seu-nome"
git config --global user.email "seu@email.com"

ssh-keygen -t ed25519 -C "seu@email.com"

# Copiar chave pública
cat ~/.ssh/id_ed25519.pub
# GitHub → Settings → SSH and GPG keys → New SSH key → colar → Add
```

#### 10. Bluetooth

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
---

## NixOS + Niri

Ambiente focado em baixo nível, DevOps e projetos paralelos — gerenciado declarativamente via Nix Flakes.

### Instalação

#### 1. Conectar ao Wi-Fi (live ISO)

```bash
nmtui
```

#### 2. Particionar o disco

```bash
lsblk
cfdisk /dev/sda
```

Layout GPT:

| Partição | Tamanho | Tipo |
|---|---|---|
| `/dev/sda1` | 1G | EFI System |
| `/dev/sda2` | Restante | Linux filesystem |

#### 3. Formatar e montar

```bash
mkfs.fat -F 32 -n boot /dev/sda1
mkfs.ext4 -L nixos /dev/sda2

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot
```

#### 4. Gerar configuração

```bash
nixos-generate-config --root /mnt
cd /mnt/etc/nixos
touch flake.nix home.nix
# copiar as configs do repositório
```

#### 5. Instalar

```bash
nixos-install --flake /mnt/etc/nixos#nixos
# definir senha root quando solicitado

nixos-enter --root /mnt -c 'passwd seu-usuario'
reboot
```

#### 6. Conectar ao Wi-Fi (pós-instalação)

```bash
nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <nome-da-rede> password <senha>
```

#### 7. Starship

```bash
# Adicionar ao ~/.bashrc
eval "$(starship init bash)"
```

#### 8. Git & SSH

```bash
ssh-keygen -t ed25519 -C "seu@email.com"

cat ~/.ssh/id_ed25519.pub
# GitHub → Settings → SSH and GPG keys → New SSH key → colar → Add
```

#### 9. Bluetooth

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
