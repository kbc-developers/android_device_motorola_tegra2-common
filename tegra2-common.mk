#
# Copyright (C) 2014 AOSP
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/tegra2-common/tegra2-common-vendor.mk)

# prefer mdpi drawables where available
PRODUCT_AAPT_CONFIG := xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.sf.lcd_density=160 \
    drm.service.enabled=true \
    ro.opengles.version=131072 \
    ro.board.platform=tegra \
    debug.hwui.render_dirty_regions=false \
    ro.zygote.disable_gl_preload=true \
    ro.bq.gpu_to_cpu_unsupported=true \
    ro.opengles.surface.rgb565=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/tablet-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    $(call add-to-product-copy-files-if-exists,packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# media config xml file
PRODUCT_COPY_FILES += \
    device/motorola/tegra2-common/configs/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    device/motorola/tegra2-common/configs/media_codecs.xml:system/etc/media_codecs.xml

# Audio configuration
PRODUCT_COPY_FILES += \
    device/motorola/tegra2-common/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
    device/motorola/tegra2-common/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Wifi
PRODUCT_COPY_FILES += \
    device/motorola/tegra2-common/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/motorola/tegra2-common/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Keylayouts
PRODUCT_COPY_FILES += \
    device/motorola/tegra2-common/usr/idc/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
    device/motorola/tegra2-common/usr/keylayout/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    device/motorola/tegra2-common/usr/keylayout/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \
    device/motorola/tegra2-common/usr/keylayout/stingray-keypad.kl:system/usr/keylayout/stingray-keypad.kl \
    device/motorola/tegra2-common/usr/keylayout/stingray-keypad.kcm:system/usr/keychars/stingray-keypad.kcm

# GPS
PRODUCT_COPY_FILES += \
    device/motorola/tegra2-common/configs/gps.conf:/system/etc/gps.conf \
    device/motorola/tegra2-common/configs/gpsconfig.xml:/system/etc/gpsconfig.xml

PRODUCT_PACKAGES += \
    camera.stingray \
    sensors.stingray \
    lights.stingray \
    audio.primary.stingray \
    audio.a2dp.default \
    audio.usb.stingray \
    audio_policy.stingray \
    power.stingray \
    librs_jni \
    make_ext4fs \
    com.android.future.usb.accessory \
    l2ping \
    hcitool \
    bttest \
    whisperd \
    e2fsck

PRODUCT_PACKAGES += \
    tctl \
    tplay \
    trec \
    twav \
    tdownsample

PRODUCT_PACKAGES += \
    Torch \
    LiveWallpapersPicker \
    PhotoTable \
    StingrayParts \
    libemoji

PRODUCT_CHARACTERISTICS := tablet

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.stingray \
    init.stingray.rc \
    init.stingray.usb.rc \
    ueventd.stingray.rc

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

WIFI_BAND := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

