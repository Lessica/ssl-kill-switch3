ARCHS := arm64 arm64e
TARGET := iphone:clang:16.5:14.0
INSTALL_TARGET_PROCESSES := Preferences

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME := SSLKillSwitchPrefs

SSLKillSwitchPrefs_FILES += SSKRootListController.m
SSLKillSwitchPrefs_FRAMEWORKS += UIKit
SSLKillSwitchPrefs_PRIVATE_FRAMEWORKS += Preferences
SSLKillSwitchPrefs_INSTALL_PATH := /Library/PreferenceBundles
SSLKillSwitchPrefs_CFLAGS += -fobjc-arc

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
SSLKillSwitchPrefs_CFLAGS += -FFrameworks/_rootless
SSLKillSwitchPrefs_LDFLAGS += -FFrameworks/_rootless
endif

ifeq ($(THEOS_PACKAGE_SCHEME),roothide)
SSLKillSwitchPrefs_CFLAGS += -FFrameworks/_roothide
SSLKillSwitchPrefs_LDFLAGS += -FFrameworks/_roothide
else
SSLKillSwitchPrefs_CFLAGS += -FFrameworks
SSLKillSwitchPrefs_LDFLAGS += -FFrameworks
endif

SSLKillSwitchPrefs_EXTRA_FRAMEWORKS += AltList

include $(THEOS_MAKE_PATH)/bundle.mk
