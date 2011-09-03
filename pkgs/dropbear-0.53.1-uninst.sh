#!/bin/bash

rm -f /usr/local/sbin/dropbear
rm -f /usr/local/bin/dropbearconvert
rm -f /usr/local/bin/dropbearkey
rm -f /usr/local/bin/dbclient

rm /etc/rc.d/rc{3,4,5,6}.d/{K,S}30dropbear
rm /etc/rc.d/init.d/dropbear