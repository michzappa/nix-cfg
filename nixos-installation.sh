sudo su

# first argument $1 is hostname
# TODO second should be drive name /dev/$2

# partitioning and formatting
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -8GiB
parted /dev/sda -- mkpart primary linux-swap -8GiB 100%
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 3 esp on
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3

# mounting 
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2

# cloning and setting up config
git clone https://github.com/michzappa/nix-cfg.git /mnt/etc/nixos
cd /mnt/etc/nixos
git submodule init
git submodule update
ln -s /mnt/etc/nixos/hosts/$1 /mnt/etc/nixos/host
nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
nix-channel --update

nixos-install
passwd
echo "Make sure to add your user after reboot!";
reboot
