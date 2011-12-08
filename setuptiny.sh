#!/usr/bin/env bash

# @see http://www.linuxfromscratch.org/lfs/view/stable/part3.html
# @see http://www.linuxfromscratch.org/lfs/view/stable/chapter08/grub.html

mkdir /mnt/lfs
export LFS=/mnt/lfs
mount -v -t ext3 /dev/sdb1 $LFS

mkdir -pv $LFS/{bin,boot,etc/opt,home,lib,mnt,opt}
mkdir -pv $LFS/{media/{floppy,cdrom},sbin,srv,var}
install -dv -m 0750 $LFS/root
install -dv -m 1777 $LFS/tmp $LFS/var/tmp
mkdir -pv $LFS/usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv $LFS/usr/{,local/}share/{doc,info,locale,man}
mkdir -v  $LFS/usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv $LFS/usr/{,local/}share/man/man{1..8}
for dir in $LFS/usr $LFS/usr/local; do
  ln -sv share/{man,doc,info} $dir
done
case $(uname -m) in
 x86_64) ln -sv lib $LFS/lib64 && ln -sv lib $LFS/usr/lib64 ;;
esac
mkdir -v $LFS/var/{lock,log,mail,run,spool}
mkdir -pv $LFS/var/{opt,cache,lib/{misc,locate},local}


tar --exclude=/usr/fakeroot --exclude=/usr/src --exclude=/usr/share -cf - /{etc,bin,var,lib,usr,sbin,boot,home} | (cd $LFS/; tar xf -)
#tar cf - /{etc,bin,var,opt,lib,usr,sbin,boot,home} | (cd $LFS/; tar xf -)

# - be careful: this strips all of the binaries it can find
find $LFS/{,usr/}{bin,lib,sbin} -type f -exec strip --strip-debug '{}' ';'
find $LFS/{,usr/}{bin,sbin} -type f -exec strip --strip-all --strip-debug '{}' ';'

chroot $LFS /usr/bin/env -i HOME=/root TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login +h

grub-install --grub-setup=/bin/true /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
grub-setup '/dev/sdb'
