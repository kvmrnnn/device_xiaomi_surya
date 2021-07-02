#
# Copyright (C) 2020 Wave-OS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from surya device
$(call inherit-product, device/xiaomi/surya/device.mk)

# Inherit some common Fluid stuff.
$(call inherit-product, vendor/fluid/config/common_full_phone.mk)

# Inherit from custom vendor
$(call inherit-product-if-exist, vendor/MiuiCamera/config.mk)


TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Device identifier
PRODUCT_NAME := fluid_surya
PRODUCT_DEVICE := surya
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO X3
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Fingerprint
BUILD_FINGERPRINT := google/redfin/redfin:11/RQ2A.210505.003/7255357:user/release-keys
BUILD_DESCRIPTION := redfin-user 11 RQ2A.210505.003 7255357 release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"

# Fluid
FLUID_BUILD_TYPE := Shrimpy
PRODUCT_PRODUCT_PROPERTIES += \
  ro.fluid.maintainer=kvmrnn \
  ro.fluid.cpu=SD732G

#APNs
PRODUCT_COPY_FILES += \
    vendor/fluid/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# GApps
WITH_GAPPS := true
IS_PHONE := true
ifeq ($(WITH_GAPPS),true)
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_GAPPS := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
endif
