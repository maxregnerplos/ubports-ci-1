#!/bin/bash
source halium.env
cd $ANDROID_ROOT

source build/envsetup.sh
export USE_CCACHE=1
breakfast aosp_f5321-eng
make -j$(nproc) mkbootimg
make -j$(nproc) hybris-boot
make -j$(nproc) halium-boot
make -j$(nproc) recoveryimage
make -j$(nproc) systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum $ANDROID_ROOT/out/target/product/rolex/halium-boot.img
md5sum $ANDROID_ROOT/out/target/product/rolex/recovery.img
md5sum $ANDROID_ROOT/out/target/product/rolex/system.img
