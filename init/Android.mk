ramdisk_init        := $(TARGET_RAMDISK_OUT)/init
ramdisk_init_real   := $(TARGET_RAMDISK_OUT)/init.real
ramdisk_init_sony   := $(TARGET_RAMDISK_OUT)/sbin/init_sony
ramdisk_keycheck    := $(TARGET_RAMDISK_OUT)/sbin/keycheck
ramdisk_toybox_init := $(TARGET_RAMDISK_OUT)/sbin/toybox_init

# If /init is a file and not a symlink then rename it to /init.real
# and make /init be a symlink to /sbin/init_sony (which will execute
# /init.real, if appropriate.
$(root_init_real): $(PRODUCT_OUT)/utilities/keycheck $(PRODUCT_OUT)/utilities/init_sony
	cp $(PRODUCT_OUT)/utilities/keycheck $(TARGET_ROOT_OUT)/sbin/keycheck
	cp $(PRODUCT_OUT)/utilities/init_sony $(TARGET_ROOT_OUT)/sbin/init_sony
	$(hide) if [ ! -L $(root_init) ]; then \
	  echo "/init $(root_init) isn't a symlink"; \
	  mv $(root_init) $(root_init_real); \
	  ln -s sbin/init_sony $(root_init); \
	else \
	  echo "init.real: $(ramdisk_init) is already a symlink"; \
	fi

ALL_DEFAULT_INSTALLED_MODULES += $(ramdisk_init_real)
