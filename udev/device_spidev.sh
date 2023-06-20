#!/bin/bash

device_add=$1
device=$2:$3
output_file=/tmp/spidev-device.log
date=`date +"%Y%m%d-%H%M%S"`

if [ ${device_add} == "ADD" ]; then
	echo "${date} SPIDEV device inserted $device" >> ${output_file}
else
	echo "${date} SPIDEV device removed $device" >> ${output_file}
fi

# exemple
# echo spidev >  /sys/bus/usb/drivers/spi-ch341-usb/3-2:1.0/spi_master/spi0/spi0.0/driver_override
# echo "spi0.0" > /sys/bus/spi/drivers/spidev/bind

# CH341A Module USB->SPI/I2C/PRINTER
if [ $device == "1a86:5512" ]; then
	if  [ ${device_add} == "ADD" ]; then
		for i in /sys/bus/usb/drivers/spi-ch341-usb/*/spi_master/spi*/spi*.*; do 
			echo "echo spidev > $i/driver_override" >> ${output_file}
			echo spidev > $i/driver_override
			echo "echo $(basename $i) > /sys/bus/spi/drivers/spidev/bind" >> ${output_file}
			echo $(basename $i) > /sys/bus/spi/drivers/spidev/bind
		done
	else	# device removed
		for i in /sys/bus/usb/drivers/spi-ch341-usb/*/spi_master/spi*/spi*.*; do 
			echo "" > $i/driver_override
			echo "echo $(basename $i) > /sys/bus/spi/drivers/spidev/unbind" >> ${output_file}
			echo $(basename $i) > /sys/bus/spi/drivers/spidev/unbind
		done
	fi    
fi
