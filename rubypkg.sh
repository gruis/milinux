#!/bin/bash

if [[ ! -z $1 ]]; then
 echo "installing $1";
else
  echo "a package must be specified"
  exit 1;
fi

# @todo verify that the gem exists on the current system
PKGNAME=$1
GEMDIR=/usr/lib/ruby/gems/1.9.1/gems/$PKGNAME
SPECDIR=/usr/lib/ruby/gems/1.9.1/specifications/
[[ -e $GEMDIR ]] || exit 1

FAKEROOT=/usr/fakeroot/$PKGNAME
CWD=`pwd`
echo "building $PKGNAME in '$FAKEROOT'"

mkdir -p ${FAKEROOT}${GEMDIR}
mkdir -p ${FAKEROOT}${SPECDIR}

cp ${SPECDIR}${PKGNAME}.gemspec ${FAKEROOT}${SPECDIR}
cd ${FAKEROOT}${GEMDIR}
cp -aRp $GEMDIR/* .
rm -rf examples
rm -rf spec
rm -rf tests
rm -rf test
rm -rf doc
rm -rf benchmark
rm -rf benchmarks

cd $FAKEROOT

echo '#!/bin/bash' > ../ruby-$PKGNAME-uninst.sh
for I in `find .`; do
  echo rm -v $I >> ../ruby-$PKGNAME-uninst.sh
done

tar -cjf ../ruby-$PKGNAME-pkg.tar.bz2 .

# @todo only strip things that are strippable
find ./{,usr/}{bin,lib,sbin} -type f -exec strip --strip-debug '{}' ';'
find ./{,usr/}{bin,sbin} -type f -exec strip --strip-all --strip-debug '{}' ';'
tar -cjf ../ruby-$PKGNAME-stripped-pkg.tar.bz2 .

cd ..
rm -rf $PKGNAME
mv ruby-$PKGNAME-pkg.tar.bz2 /opt/pkgs/
mv ruby-$PKGNAME-stripped-pkg.tar.bz2 /opt/pkgs

unset PKGNAME
