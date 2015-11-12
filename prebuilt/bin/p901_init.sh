#!/system/bin/busybox sh

#INIT for ZX803 ONLY

BUSYBOX="/system/bin/busybox"

#echo "4096" > /sys/devices/virtual/bdi/7:4/read_ahead_kb
#echo "4096" > /sys/devices/virtual/bdi/179:0/read_ahead_kb
#echo "256" > /sys/devices/virtual/bdi/93:0/read_ahead_kb



#busybox hwclock -s

echo p901>>/data/run.log
date>>/data/run.log

if [ ! -e /data/system.notfirstrun ]; then
 echo "">/data/swapon.flg
fi

if [ -e /data/zram.flg ]; then
 busybox sysctl -w vm.swappiness=90
 echo '1' > /sys/block/zram0/reset
 echo $((256*1024*1024)) > /sys/block/zram0/disksize
 busybox mkswap /dev/block/zram0
 busybox swapon /dev/block/zram0
fi


if [ -e /data/swapon.flg ]; then
 busybox sysctl -w vm.swappiness=90
  busybox mkswap /dev/block/nandi
  busybox swapon /dev/block/nandi
fi

#        while [ ! -e /data/system/packages.list ]
#        do
#         sleep 1
#         echo wait...>>/data/run.log
#        done

 echo continue...>>/data/run.log

sleep 5

if [ ! -e /data/system.notfirstrun ]; then
mkdir /data/InterNav
chmod 777 /data/InterNav
chmod -R 777 /data/InterNav/*
chmod -R 777 /system/config/*
#chmod -R 777 /data/data/*
#chmod -R 777 /data/data/com.android.settings/*

#busybox cp -rf /system/config/data/* /data/data/
#busybox cp -p /system/config/wallpaper /data/data/com.android.settings/files/wallpaper
#busybox cp -p -f /system/config/appwidgets.xml /data/system/
busybox tar -xf /system/config/data_backup.tar data/data
busybox tar -xf /system/config/system_backup.tar data/system

busybox cp -p -f /system/config/cfg.xml /data/InterNav/cfg.xml
#busybox cp -p -f /system/config/pointercal /data
#chmod 666 /data/pointercal

#chmod -R 777 /data/data/*

#rm /data/data/com.android.providers.settings/databases/settings.db-*


#echo "">/data/zram.flg
echo "">/data/swapon.flg
        $BUSYBOX touch /data/system.notfirstrun
        sync
        sleep 1
#        reboot
fi


#echo waiting for shutdown>>/data/run.log
#sleep 90000
#echo shutdown>>/data/run.log
#sync
#echo 1 > /sys/class/gpio_sw/PH6/data


exit 0