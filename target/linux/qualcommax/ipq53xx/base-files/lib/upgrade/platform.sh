PART_NAME=firmware
REQUIRE_IMAGE_METADATA=1

RAMFS_COPY_BIN='fw_printenv fw_setenv head'
RAMFS_COPY_DATA='/etc/fw_env.config /var/lock/fw_printenv.lock'

platform_check_image() {
	return 0
}

platform_do_upgrade() {
	case "$(board_name)" in
	glinet,gl-be9300)
		# WARNING: eMMC partition layout for the GL-BE9300 has NOT been
		# verified against a stock unit. The "0:HLOS" / "rootfs" GPT
		# labels below are inherited from the 8devices Kiwi-DVK (IPQ9574)
		# pattern and may not match the GL.iNet partitioning. Writing the
		# wrong partition can destroy the bootloader and brick the device.
		#
		# Until partition labels are confirmed via `cat /proc/partitions`
		# + `sgdisk -p /dev/mmcblk0` on a stock unit, this device is
		# initramfs-only. Comment out the next line and uncomment the
		# emmc_do_upgrade call below ONLY after validation.
		echo "GL-BE9300 sysupgrade not validated. Initramfs-only." >&2
		return 1
		# CI_KERNPART="0:HLOS"
		# CI_ROOTPART="rootfs"
		# emmc_do_upgrade "$1"
		;;
	*)
		default_do_upgrade "$1"
		;;
	esac
}

platform_copy_config() {
	case "$(board_name)" in
	glinet,gl-be9300)
		# emmc_copy_config (disabled until partition layout is verified)
		;;
	esac
}
