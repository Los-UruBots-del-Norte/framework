#!/bin/bash

##############################################################################
# Primero dar permisos de ejecucion:										 #
# chmod a+x installer.sh 											 #
#																			 #	
# Volver a ejecutar el script si se detiene, borrar manualmente las carpetas #
##############################################################################

echo "##### UruBots - ER-Force Framework #####"

echo "##### Installing Dependencies #####"
sudo apt-get install cmake protobuf-compiler libprotobuf-dev qtbase5-dev libqt5opengl5-dev g++ libusb-1.0-0-dev libsdl2-dev libqt5svg5-dev libssl-dev cmake-curses-gui git -y

dir="$PWD/erforceSimulator"
mkdir $dir

if [ -d "$dir" ];
then
	#echo "$dir directory exists."
    echo "##### Cloning repository #####"
	git clone https://github.com/Los-UruBots-del-Norte/framework.git $dir

	echo "##### Building Simulator #####"
	cd "$dir" 
	#################################################################
	# Descomentar estas lineas en caso de querer volver a buildear  #
	#################################################################
	#if [ -d "$dir/build" ];
	#then
	#	rm -rf "$dir/build"
	#else
		mkdir build && cd build
		cmake -DDOWNLOAD_V8=TRUE ..
		make
		###############################################################################
		# Revisar la documentacion y descomentar estar lineas en caso de necesitarlas.#
		# https://github.com/robotics-erlangen/framework/blob/master/COMPILE.md       #
		###############################################################################

		#cmake -DCMAKE_PREFIX_PATH=~/Qt/5.6/gcc_64/lib/cmake ..
		#cmake -DDOWNLOAD_V8=TRUE ..
		#cmake -DEASY_MODE=TRUE ..
		#sudo cp data/udev/99-robotics-usb-devices.rules /etc/udev/rules.d/99-robotics-usb-devices.rules

		echo "##### Installing app #####"
		make install-menu
		echo "##### Opening app #####"
		cd "$dir/build/bin" && ./ra
else
	echo "##### ERROR: $dir directory does not exist. #####"
fi

echo "##### Ending Installing app #####"
exit 0 #Exit with success








