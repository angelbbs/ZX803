#!/system/bin/busybox sh

BUSYBOX="/system/bin/busybox"

chmod 777 /data/data/internav.zxnet.afm/radio.flg
chmod 777 /data/InterNav
chmod -R 777 /data/InterNav/*
echo -n "0">/data/data/internav.zxnet.afm/radio.flg
chmod 777 /data/data/internav.zxnet.afm/radio.flg


if [ ! -e /data/preinstall.completed ]; then
echo preinstall>>/data/run.log
date>>/data/run.log

  /system/bin/sh /system/bin/pm preinstall /system/preinstall

mkdir /mnt/extsd/Picture/wallpaper
busybox cp -rf /system/wallpaper/* /mnt/extsd/Picture/wallpaper/

 $BUSYBOX touch /data/preinstall.completed
 sync
 sleep 1
# busybox killall zygote
 reboot
fi


exit 0


