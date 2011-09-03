#!/usr/bin/env bash

# Assumes that you have a disk (/dev/sdb) mounted under /mnt that you want to
# turn into a clone of running machine.

mkdir -pv /mnt/{bin,boot,etc/opt,home,lib,mnt,opt}
mkdir -pv /mnt/{media/{floppy,cdrom},sbin,srv,var}
install -dv -m 0750 /mnt/root
install -dv -m 1777 /mnt/tmp /mnt/var/tmp
mkdir -pv /mnt/usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv /mnt/usr/{,local/}share/{doc,info,locale,man}
mkdir -v  /mnt/usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv /mnt/usr/{,local/}share/man/man{1..8}
for dir in /mnt/usr /mnt/usr/local; do
  ln -sv share/{man,doc,info} $dir
done
case $(uname -m) in
 x86_64) ln -sv lib /mnt/lib64 && ln -sv lib /mnt/usr/lib64 ;;
esac
mkdir -v /mnt/var/{lock,log,mail,run,spool}
mkdir -pv /mnt/var/{opt,cache,lib/{misc,locate},local}


tar cf - /{etc,bin,var,opt,lib,usr,sbin,boot,home} | (cd /mnt/; tar xf -)

# - be careful: this strips all of the binaries it can find
find /mnt/{,usr/}{bin,lib,sbin} -type f -exec strip --strip-debug '{}' ';'
find /mnt/{,usr/}{bin,sbin} -type f -exec strip --strip-all --strip-debug '{}' ';'

chroot /mnt /usr/bin/env -i HOME=/root TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login +h

grub-install --grub-setup=/bin/true /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
grub-setup '/dev/sdb'