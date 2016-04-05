# Copyright (C) 2013 OmniROM Project
# Copyright (C) 2012 The CyanogenMod Project
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

# Inherit device configuration
$(call inherit-product, device/softwinner/907/full_907.mk)
$(call inherit-product, device/softwinner/907/907-blobs.mk)

# Inherit from our omni product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit Omni GSM telephony parts
$(call inherit-product, vendor/omni/config/gsm.mk)

## Device identifier. This must come after all inclusions
<<<<<<< HEAD:cm.mk
PRODUCT_NAME := cm_907
PRODUCT_BRAND := ZXNET
=======
PRODUCT_NAME := omni_907
PRODUCT_BRAND := Google
>>>>>>> ugers/omni-4.4:omni_907.mk
PRODUCT_DEVICE := 907
PRODUCT_MODEL := ZX803
PRODUCT_MANUFACTURER := zxnet
PRODUCT_RELEASE_NAME := 907

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=zxnet TARGET_DEVICE=zx803 BUILD_FINGERPRINT="angelbbs/zxnet/zx803:4.4.4/KOT49H/402395:user/release-keys" PRIVATE_BUILD_DESC="zx803-user 4.4.4 KOT49H 402395 release-keys"

# Allow ADB (to access dev settings)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0 ro.secure=0 ro.allow.mock.location=1 service.adb.enable=1 persist.sys.usb.config=mass_storage ro.debuggable=1 persist.service.adb.enable=1 rild.libpath=/system/lib/libsoftwinner-ril.so
