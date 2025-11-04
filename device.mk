#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/psyche

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure gsi_keys.mk
#$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 30
# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 31

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# fastbootd
PRODUCT_PACKAGES += \
	android.hardware.fastboot@1.0-impl-mock \
	android.hardware.fastboot@1.0-impl-mock.recovery \
	fastbootd

# FUSE passthrough
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# Qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

#--------------------------
# to work around a (hash verification) ROM flashing error caused by crDroid+NikGapps on alioth
# (see the edits in update_engine's payload_consumer/filesystem_verifier_action.cc -
# ro.virtual_ab.skip_verify_source_hash=true)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.virtual_ab.skip_verify_source_hash=true
#--------------------------
#
