export PACKAGE_VERSION := 1.4-3

ARCHS := arm64 arm64e
TARGET := iphone:clang:16.5:14.0
GO_EASY_ON_ME := 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := SSLKillSwitch2

SSLKillSwitch2_FILES += SSLKillSwitch/SSLKillSwitch.m
SSLKillSwitch2_CFLAGS += -fobjc-arc
SSLKillSwitch2_CFLAGS += -ISSLKillSwitch/fishhook
SSLKillSwitch2_FRAMEWORKS += Security

ifndef FISHHOOK

ifdef ROOTLESS
THEOS_PACKAGE_SCHEME := rootless
PACKAGE_BUILDNAME := rootless
else ifdef ROOTHIDE
# THEOS_PACKAGE_ARCH := iphoneos-arm64e # must set afterwards if using original theos
THEOS_PACKAGE_SCHEME := roothide
PACKAGE_BUILDNAME := roothide
else # ROOTLESS / ROOTHIDE
PACKAGE_BUILDNAME := rootful
endif # ROOTLESS / ROOTHIDE

ifneq ($(findstring DEBUG,$(THEOS_SCHEMA)),)
PACKAGE_BUILDNAME := $(PACKAGE_BUILDNAME)debug
endif

SSLKillSwitch2_CFLAGS += -DSUBSTRATE_BUILD

else  # FISHHOOK

SSLKillSwitch2_FILES += SSLKillSwitch/fishhook/fishhook.c
# avoid linking Substrate
SSLKillSwitch2_LOGOS_DEFAULT_GENERATOR := internal

endif # FISHHOOK

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += SSLKillSwitchPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk

export THEOS_PACKAGE_SCHEME
export THEOS_STAGING_DIR
before-package::
	@devkit/before-package.sh
