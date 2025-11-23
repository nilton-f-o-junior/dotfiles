<p align="center">
	<img src="img/rust-logo.png">
</p>

# arch

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
sudo pacman -S alacritty git helix hyprshot rofi ufw yazi starship swww cronie
sudo pacman -Rsn nano htop kitty dolphin wofi 
             
# sudo pacman -S nerd-fonts
# JetBrains (42) + Nerd Font Icons (53)
```          
             
`yay`        
             
```bash      
y.git && cd yay && makepkg -sise-devel && git clone https://aur.archlinux.org/ya--More--(36%)
             
yay -S google-chrome
yay -S aseprite
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
git@github.com: ... > yesory > copy > SSH git@github.com: ... > paste git clone --More--(78%)
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

`swww`

```rust
swww-daemon &
mkdir .config/swww/background
swww img ~/.config/swww/background/astralgrave0.png
```

`cronie`

```bash
sudo systemctl start cronie.service
sudo systemctl enable cronie.service
systemctl status cronie.service

EDITOR=helix crontab -e
0 */3 * * * WAYLAND_DISPLAY=wayland-1 XDG_RUNTIME_DIR=/run/user/1000 /home/user/.config/swww/swww.sh
```
