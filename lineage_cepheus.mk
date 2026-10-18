#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from cepheus device
$(call inherit-product, device/xiaomi/cepheus/device.mk)

PRODUCT_NAME := lineage_cepheus
PRODUCT_DEVICE := cepheus
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 9

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="cepheus-user 11 RKQ1.200826.002 V12.5.1.0.RFAMIXM release-keys" \
    BuildFingerprint=Xiaomi/cepheus/cepheus:11/RKQ1.200826.002/V12.5.1.0.RFAMIXM:user/release-keys

# 选择是否将当前时、分、秒添加到版本号中
AVIUM_VERSION_APPEND_TIME_OF_DAY ?= true
# 构建者名称
AVIUM_MAINTAINER ?= YangQi0408

# Soc型号
AVIUM_SETTINGS_SOC_MODEL_NAME ?= SM8150
# 设备代号
AVIUM_SETTINGS_DEVICE_CODENAME ?= cepheus

# 选择是否开启gms
# cepheus 为 legacy A-only 设备，super 分区仅 6.4GB，默认构建 vanilla
WITH_GMS ?= false
# LatinIMEGooglePrebuilt
# 仅在构建非gms版本时起作用
TARGET_INCLUDE_GOOGLEIME ?= false
TARGET_GOOGLEIME_OVERRIDE_IME ?= false

# 将此配置指定为true来开启欺骗 Prop，
# 用于隐藏 bootloader 解锁状态
AVIUM_FORCE_SET_FAKE_PROP ?= false

# 通常在 Android 16 QPR2 上，模糊已经默认启用
# 将 TARGET_FORCE_ENABLE_BLUR 指定为true来强制开启模糊
TARGET_FORCE_ENABLE_BLUR ?= false
