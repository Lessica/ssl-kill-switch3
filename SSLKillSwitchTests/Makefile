ARCHS := x86_64 arm64
TARGET := macosx:clang:latest

include $(THEOS)/makefiles/common.mk

TOOL_NAME := SSLKillSwitchTest
SSLKillSwitchTest_FILES += SSLKillSwitchTests.m
SSLKillSwitchTest_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/tool.mk
