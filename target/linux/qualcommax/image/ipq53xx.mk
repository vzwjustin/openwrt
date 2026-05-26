define Device/glinet_gl-be9300
	$(call Device/FitImage)
	DEVICE_VENDOR := GL.iNet
	DEVICE_MODEL := GL-BE9300
	DEVICE_ALT0_VENDOR := GL.iNet
	DEVICE_ALT0_MODEL := Flint 3
	SOC := ipq5332
	BLOCKSIZE := 65536
	# DEVICE_DTS_CONFIG omitted: Flint 3 ships a vendor U-Boot; the right
	# FIT config name needs to be confirmed from a stock boot log.
	DEVICE_PACKAGES := \
		ath12k-firmware-qcn9274 \
		ipq-wifi-glinet_gl-be9300 \
		kmod-ath12k \
		kmod-phy-realtek \
		kmod-usb-storage \
		e2fsprogs f2fsck mkf2fs \
		uboot-envtools
	# NOTE: only the FitImage (initramfs) build target is wired. eMMC
	# sysupgrade is disabled in platform.sh until the partition layout
	# is verified against stock firmware. Recovery via U-Boot tftpboot
	# of -initramfs-uImage.itb is the only supported flow today.
endef
TARGET_DEVICES += glinet_gl-be9300
