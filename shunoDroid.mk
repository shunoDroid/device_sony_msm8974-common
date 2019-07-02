# Kernel properties
ifeq (,$(filter $(TARGET_KERNEL_SOURCE),))
  TARGET_KERNEL_ARCH := arm
  TARGET_KERNEL_ADDITIONAL_CONFIG := shunodroid_defconfig
  KERNEL_TOOLCHAIN_VERSION := 7.x
  KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-unknown-linux-androideabi-$(KERNEL_TOOLCHAIN_VERSION)/bin
  KERNEL_TOOLCHAIN_PREFIX := arm-unknown-linux-androideabi-
endif

-include vendor/shunodroid/shunodroid.mk
