# Kernel properties
ifeq (,$(filter $(TARGET_KERNEL_SOURCE),))
  KERNEL_TOOLCHAIN_VERSION := 7.x
  KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-unknown-linux-androideabi-$(KERNEL_TOOLCHAIN_VERSION)/bin
  KERNEL_TOOLCHAIN_PREFIX := arm-unknown-linux-androideabi-
endif
