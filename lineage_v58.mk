#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Not set in time to check, so set before everything else
PRODUCT_IS_ATV := true

# BRING-UP ONLY -- gives ro.adb.secure=0 / ro.debuggable=1. Must be set here
# rather than in BoardConfigCommon.mk; board config is read after product
# config. Comes out with androidboot.selinux=permissive.
WITH_ADB_INSECURE := true

# Inherit some common AOSP stuff
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := H96
PRODUCT_DEVICE := v58
PRODUCT_MANUFACTURER := rockchip
PRODUCT_MODEL := H96 Max V58
PRODUCT_NAME := lineage_v58
PRODUCT_SYSTEM_NAME := v58

PRODUCT_GMS_CLIENTID_BASE := android-rockchip-tv

# Report an ADT-3 style ATV build, like the M9S,
# so ATV apps that gate on a known fingerprint behave. build.prop is generated
# by Soong now, so these are product_config.json keys (BuildDesc was
# PRIVATE_BUILD_DESC, DeviceProduct was TARGET_PRODUCT), and an unknown one is
# a hard error.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="adt3-user 14 UTM1.240509.001 11749621 release-keys" \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := google/adt3/adt3:14/UTM1.240509.001/11749621:user/release-keys
