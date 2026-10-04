#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## TEE
TARGET_HAS_TEE := true

## Infrared remote
# The input device is the PWM node the Rockchip IR driver binds to (pwm3, 'fd8b0030.pwm').
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fd8b0030_pwm.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/fd8b0030_pwm.kl \
    $(LOCAL_PATH)/keylayout/fd8b0030_pwm.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/fd8b0030_pwm.idc

## Screen density
PRODUCT_AAPT_CONFIG := xlarge large tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

## fstab
# Needed in the first-stage ramdisk and on /vendor for second stage.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/fstab.rk30board:$(TARGET_COPY_OUT_RAMDISK)/fstab.rk30board \
    $(LOCAL_PATH)/init-files/fstab.rk30board:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rk30board

## Audio policy (HDMI and SPDIF)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

## Bluetooth transport
# Both name the controller's UART (/dev/ttyS9); keep them together.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf \
    $(LOCAL_PATH)/init-files/init.connectivity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.connectivity.rc

## Boot-time kernel modules (ethernet PHY)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.cfg

## Inherit from the SoC and common tree product makefiles
$(call inherit-product, device/rockchip/rk35xx-common/rk3588/rk3588.mk)

## Inherit from the proprietary files makefile
$(call inherit-product-if-exists, vendor/h96/v58/v58-vendor.mk)
