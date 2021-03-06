# Copyright (C) 2014 AOJP
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
USE_PROPRIETARY_AUDIO_EXTENSIONS := false

# Platform
BOARD_VENDOR := motorola
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := ap20
TARGET_BOARD_PLATFORM_GPU := tegra

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := generic
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# DO NOT change the following line to vfpv3 as it is not really supported on our device!
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel
BOARD_KERNEL_CMDLINE         := androidboot.carrier=wifi-only product_type=w
BOARD_KERNEL_PAGESIZE        := 2048
BOARD_KERNEL_BASE            := 0x10000000
BOARD_MKBOOTIMG_ARGS         := --ramdisk_offset 0x02000000

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056858112
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29859115008
BOARD_FLASH_BLOCK_SIZE := 4096

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_OMX_NEEDS_LEGACY_AUDIO := true
BOARD_USB_AUDIO_CARD_ID := 0

# Camera
USE_CAMERA_STUB := false
TARGET_NEED_CAMERA_ZSL := true
TARGET_NEED_SAMSUNG_MAGIC_ZSL_1508 := true
TARGET_ADD_ISO_MODE_1600 := true
TARGET_ADD_ISO_MODE_HJR := true
TARGET_DISABLE_ZSL_FOR_FFC := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/motorola/tegra2-common/configs/egl.cfg
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
SKIP_SET_METADATA := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_USES_HWCOMPOSER := true
BOARD_EGL_NEEDS_LEGACY_FB := true
#MAX_EGL_CACHE_KEY_SIZE := 4096
#MAX_EGL_CACHE_SIZE := 2146304
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
# BOARD_BLUEDROID_VENDOR_CONF :=
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/motorola/tegra2-common/bluetooth

# Wifi related defines
WPA_BUILD_SUPPLICANT        	:= true
WPA_SUPPLICANT_VERSION      	:= VER_0_8_X
BOARD_WLAN_DEVICE           	:= bcmdhd

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
#WIFI_DRIVER_FW_PATH_MFG     := "/vendor/firmware/fw_bcmdhd_mfg.bin"

# Vold
BOARD_VOLD_MAX_PARTITIONS := 12
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/fsl-tegra-udc/gadget/lun%d/file"

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_UI_LIB := librecovery_ui_stingray
TARGET_RECOVERY_FSTAB := device/motorola/tegra2-common/rootdir/etc/fstab.stingray
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/fsl-tegra-udc/gadget/lun%d/file"
BOARD_RECOVERY_SWIPE := true

# Misc flags
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Compatibility with pre-kitkat Sensor HALs
SENSORS_NEED_SETRATE_ON_ENABLE := true

# BOARD_LIB_DUMPSTATE := libdumpstate.wingray
TARGET_RELEASETOOLS_EXTENSIONS := device/motorola/tegra2-common

-include vendor/motolora/stingray/BoardConfigVendor.mk

# CM Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

TARGET_BOARD_INFO_FILE ?= device/motorola/tegra2-common/board-info.txt
