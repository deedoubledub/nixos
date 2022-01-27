# My NixOS Configuration

Each branch is the configuration for a specific host for the purposes
of tracking host-specific configuration differences.


## TODO

- [ ] configure lightdm
- [ ] LUKS encryption

## Installation Quick Start

1. Boot installer live media
2. Format disks
```
$ lsblk
$ sudo fdisk /dev/<disk>

# GPT partition
# Partition 1: +200M, Type 1 (EFI System)
# Partition 2: remaining space, Type default (Linux filesystem)

$ sudo mkfs.fat -F 32 /dev/<disk>1
$ sudo fatlabel /dev/<disk>1 NIXBOOT
$ sudo mkfs.ext4 /dev/<disk>2 -L NIXROOT
```
3. Mount disks
```
$ sudo mount /dev/disk/by-label/NIXROOT /mnt
$ sudo mkdir /mnt/boot
$ sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot
```
4. Create swapfile
```
# 2GB swap
$ sudo dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=2097152
$ sudo chmod 600 /mnt/.swapfile
$ sudo mkswap /mnt/.swapfile
```
5. Generate configuration
```
$ sudo nixos-generate-config --root /mnt
$ cd /mnt/etc/nixos
```
6. Import configuration from this repo
7. Configure nix channels
```
$ sudo nix-channel --add <url> <channel>
```
8. Build the system
```
$ sudo nixos-install
```
8. Chroot into new system
```
$ sudo nixos-enter

# change password
# configure ssh
# configure dotfiles
```
9. Reboot into new system
