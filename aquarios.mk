# Copyright (C) 2019 AquariOS
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

# This file is the build configuration for an aosp Android
# build for flame hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and AquariOS.

# Include AquariOS common configurations
include vendor/aquarios/config/aqua_full_phone.mk

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/coral/aosp_flame.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

PRODUCT_NAME := aqua_flame
PRODUCT_DEVICE := flame
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 4
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="flame" \
    TARGET_DEVICE="flame" \
    PRIVATE_BUILD_DESC="flame-user 10 QQ2A.200405.005 6254899 release-keys"

BUILD_FINGERPRINT := "google/flame/flame:10/QQ2A.200405.005/6254899:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/flame/flame:10/QQ2A.200405.005/6254899:user/release-keys

BOARD_PREBUILT_VENDORIMAGE := vendor/images/flame/vendor.img

$(call inherit-product, vendor/google/flame/flame-vendor.mk)
$(call inherit-product, vendor/pixelgapps/pixel-gapps.mk)

# Bootanimation display properties
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Include a check for required repos - error out if not present
$(call inherit-product, device/google/flame/aqua_requirements.mk)
