#!/usr/bin/env bash

mkdir /mnt/lfs
export LFS=/mnt/lfs
mount -v -t ext3 /dev/sdb1 $LFS


# missing binutils
# missing check
# missing dejagnu
# missing expect
# missing glibc
# missing iproute2
# missing shadow

./addpkg /opt/pkgs/autoconf-2.68-pkg.tar.bz2 
./addpkg /opt/pkgs/automake-1.11.1-pkg.tar.bz2 
./addpkg /opt/pkgs/bash-4.2-pkg.tar.bz2 
./addpkg /opt/pkgs/bison-2.4.3-pkg.tar.bz2 
./addpkg /opt/pkgs/bzip2-1.0.6-pkg.tar.bz2 
./addpkg /opt/pkgs/coreutils-8.10-pkg.tar.bz2 
./addpkg /opt/pkgs/diffutils-3.0-pkg.tar.bz2 
./addpkg /opt/pkgs/e2fsprogs-1.41.14-pkg.tar.bz2 
./addpkg /opt/pkgs/file-5.05-pkg.tar.bz2 
./addpkg /opt/pkgs/findutils-4.4.2-pkg.tar.bz2 
./addpkg /opt/pkgs/flex-2.5.35-pkg.tar.bz2 
./addpkg /opt/pkgs/gawk-3.1.8-pkg.tar.bz2 
./addpkg /opt/pkgs/grep-2.7-pkg.tar.bz2 
./addpkg /opt/pkgs/grub-1.98-pkg.tar.bz2 
./addpkg /opt/pkgs/gzip-1.4-pkg.tar.bz2 
./addpkg /opt/pkgs/iana-etc-2.30-pkg.tar.bz2 
./addpkg /opt/pkgs/inetutils-1.8-pkg.tar.bz2 
./addpkg /opt/pkgs/less-436-pkg.tar.bz2 
./addpkg /opt/pkgs/libtool-2.4-pkg.tar.bz2 
./addpkg /opt/pkgs/less-436-pkg.tar.bz2 
./addpkg /opt/pkgs/kbd-1.15.2-pkg.tar.bz2 
./addpkg /opt/pkgs/m4-1.4.15-pkg.tar.bz2 
./addpkg /opt/pkgs/linux-2.6.39.4-pkg.tar.bz2 
./addpkg /opt/pkgs/readline-6.2-pkg.tar.bz2 
./addpkg /opt/pkgs/sed-4.2.1-pkg.tar.bz2 
./addpkg /opt/pkgs/util-linux-2.19-pkg.tar.bz2 
./addpkg /opt/pkgs/kbd-1.15.2-pkg.tar.bz2 
./addpkg /opt/pkgs/libxml2-2.7.7-pkg.tar.bz2 
./addpkg /opt/pkgs/libxslt-1.1.26-pkg.tar.bz2 
./addpkg /opt/pkgs/openssl-1.0.0d-pkg.tar.bz2 
./addpkg /opt/pkgs/xz-5.0.1-pkg.tar.bz2 
./addpkg /opt/pkgs/curl-7.21.7-pkg.tar.bz2 
./addpkg /opt/pkgs/procps-3.2.8-pkg.tar.bz2 
./addpkg /opt/pkgs/pkg-config-0.25-pkg.tar.bz2 
./addpkg /opt/pkgs/which-2.20-pkg.tar.bz2 
./addpkg /opt/pkgs/gettext-0.18.1.1-pkg.tar.bz2 
./addpkg /opt/pkgs/ruby-1.9.2-p290-stripped-pkg.tar.bz2 
./addpkg /opt/pkgs/zlib-1.2.5-pkg.tar.bz2 
