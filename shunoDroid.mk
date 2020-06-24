# Kernel properties
ifeq (,$(filter $(TARGET_KERNEL_SOURCE),))
  KERNEL_TOOLCHAIN_VERSION := 10.1.0
  KERNEL_TOOLCHAIN_PREFIX := arm-unknown-linux-gnueabi-
  KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/$(HOST_OS)-x86/arm/${KERNEL_TOOLCHAIN_PREFIX}$(KERNEL_TOOLCHAIN_VERSION)/bin
endif
