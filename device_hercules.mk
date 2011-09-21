#
# Copyright (C) 2011 The CyanogenMod Project
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

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.com.google.clientidbase=android-samsung \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.heapsize=64m \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

$(call inherit-product-if-exists, vendor/samsung/hercules/hercules-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH):/overlay

PRODUCT_PACKAGES += \
    librs_jni \
    gralloc.msm8660 \
    copybit.msm8660 \
    overlay.default \
    liboverlay \
#    lights.hercules \
    com.android.future.usb.accessory

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/init.rc:root/init.rc \
    $(LOCAL_PATH)/init.qcom.lpm_boot.sh:root/init.qcom.lpm_boot.sh \
    $(LOCAL_PATH)/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml

# Permissions and features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml 

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
    $(LOCAL_PATH)/keychars/sec_touchkey.kcm.bin:system/usr/keychars/sec_touchkey.kcm.bin \
    $(LOCAL_PATH)/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    $(LOCAL_PATH)/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/keylayout/sec_power_key.kl:system/usr/keylayout/sec_power_key.kl \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Needed to reset bootmode when leaving recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# device uses high-density artwork where available
PRODUCT_LOCALES += hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_hercules
PRODUCT_DEVICE := hercules
PRODUCT_MODEL := SGH-T989
PRODUCT_MANUFACTURER := samsung
