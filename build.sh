#!/bin/bash

rm .version

# Bash Color

green='\033[01;32m'

red='\033[01;31m'

blink_red='\033[05;31m'

restore='\033[0m'



clear


# Vars

BASE_AK_VER="Despair"

AK_VER="$BASE_AK_VER$VER"

export LOCALVERSION=~`echo $AK_VER`

export LOCALVERSION=~`echo $AK_VER`

export ARCH=arm

export SUBARCH=arm

export KBUILD_BUILD_USER=DespairFactor

export KBUILD_BUILD_HOST=DarkRoom

KERNEL_DIR=~/android/shamu
ZIMAGE_DIR=~/android/shamu/arch/arm/boot

# Resources

THREAD="-j$(grep -c ^processor /proc/cpuinfo)"

KERNEL="zImage"

DTBIMAGE="dtb"

DEFCONFIG="despair_defconfig"

export CROSS_COMPILE=${HOME}/android/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-


# Functions

function make_kernel {

		echo

		make $DEFCONFIG

		make $THREAD



}

function make_boot {
		cp -vr $ZIMAGE_DIR/zImage-dtb ~/android/AnyKernel2/zImage
}


function make_zip {
		cd ~/android/AnyKernel2/
		zip -r9 `echo $AK_VER`.zip *
		mv  `echo $AK_VER`.zip $ZIP_MOVE
		cd $KERNEL_DIR
}

DATE_START=$(date +"%s")





echo -e "${green}"

echo "-----------------"

echo "Making Despair Kernel:"

echo "-----------------"

echo -e "${restore}"

make_kernel
make_boot
make_zip







