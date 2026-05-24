SUBTARGET:=ipq53xx
BOARDNAME:=Qualcomm Atheros IPQ53xx
DEFAULT_PACKAGES += \
	ath12k-firmware-qcn9274 \
	kmod-ath12k

define Target/Description
	Build firmware images for Qualcomm Atheros IPQ53xx based boards.
endef
