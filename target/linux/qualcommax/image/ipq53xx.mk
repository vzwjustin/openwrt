define Device/glinet_gl-be9300
	$(call Device/FitImage)
	$(call Device/EmmcImage)
	DEVICE_VENDOR := GL.iNet
	DEVICE_MODEL := GL-BE9300
	DEVICE_ALT0_VENDOR := GL.iNet
	DEVICE_ALT0_MODEL := Flint 3
	SOC := ipq5332
	KERNEL_INSTALL := 1
	BLOCKSIZE := 65536
	DEVICE_DTS_CONFIG := config@mi01.6
	DEVICE_PACKAGES := \
		ath12k-firmware-qcn9274 \
		ipq-wifi-glinet_gl-be9300 \
		kmod-ath12k \
		kmod-phy-realtek \
		kmod-usb-storage \
		e2fsprogs f2fsck mkf2fs \
		uboot-envtools
endef
TARGET_DEVICES += glinet_gl-be9300
