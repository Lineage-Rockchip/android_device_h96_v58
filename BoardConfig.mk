#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/h96/v58

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := rk30board

## DTB
TARGET_DTB_NAME := rk3588-h96-max-v58

## Partitions
# From the stock parameter.txt; read by the common BoardConfig, so set before the include.
BOARD_SUPER_PARTITION_SIZE := 3263168512

## Boot devices
# Stock cmdline: eMMC only.
RK_BOOT_DEVICES := fe2e0000.mmc

## Stock boot.img artifacts: a single-entry dtbo.img, and the logo bitmaps resource.img is repacked around
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_STOCK_RESOURCE_IMAGE := $(DEVICE_PATH)/prebuilt/resource.img

## Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init-files/fstab.rk30board

## Display
TARGET_SCREEN_DENSITY := 320

## Include the SoC and common tree BoardConfig makefiles
include device/rockchip/rk35xx-common/rk3588/BoardConfigSoc.mk

## Partition sizes from the stock parameter.txt; after the include, which sets the common ones
BOARD_BOOTIMAGE_PARTITION_SIZE := 50331648
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 113246208

## Kernel config, board delta -- after the include so it is merged last
TARGET_KERNEL_CONFIG_EXT += \
    $(TARGET_KERNEL_SOURCE)/arch/arm64/configs/rk3588_v58.config

## Kernel modules
# AP6275P (BCM43752) over PCIe; the Wi-Fi HAL insmods it, see wifi.load.
TARGET_KERNEL_EXT_MODULES += wifi/bcmdhd:kbuild

BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    realtek.ko \
    bcmdhd.ko

## Include the proprietary BoardConfig makefile
-include vendor/h96/v58/BoardConfigVendor.mk
