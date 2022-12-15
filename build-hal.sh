#!/bin/bash
source halium.env
cd $ANDROID_ROOT

source build/envsetup.sh
export USE_CCACHE=1
breakfast aosp_f5321-eng
make -j$(nproc) mkbootimg
make -j$(nproc) hybris-boot
 

