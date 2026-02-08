`install`

```bash
# connect wifi
nmtui

# install
sudo -i

# list disk
lsblk

# partition
cfdisk /dev/sda

# gpt
new > 1G > Type: EFI-System
new > Enter > Write > Yes

# lsblk
mkfs.ext4 -L nixos /dev/sda2 > Enter
mkfs.fat -F 32 -n boot /dev/sda1 > Enter

# mount
mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot

#lsblk
# ok?

# generation config
nixos-generate-config --root /mnt
cd /mnt/etc/nixos
touch flake.nix home.nix

# vim
# cp config nix!

# nix-install
nixos-install --flake /mnt/etc/nixos#nixos
# password

# password user
nixos-enter --root /mnt -c ´passwd user´
reboot
```

`connect`

```bash
nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <name> password <password>
```          
             
`starship`   
             
```bash      
helix ~/.bashrc
eval "$(starship init bash)"
```          
             
`git`        
             
```bash      
# config     
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
