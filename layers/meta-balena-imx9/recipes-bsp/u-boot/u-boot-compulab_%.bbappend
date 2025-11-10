FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

inherit resin-u-boot
DEPENDS = "bison-native"

SRC_URI:append = " \
    file://0001-compulab-imx93-Add-BalenOS-environmet.patch \
    file://balena.cfg \
"

SRC_URI:remove = " \
	resin-specific-env-integration-non-kconfig.patch \
"

BALENA_DEVICE_FDT_ADDR_VAR = "fdt_addr_r"
BALENA_UBOOT_DEVICE_TYPES = "usb mmc"
UBOOT_KCONFIG_SUPPORT = "0"

# Upstream uses AUTOREV, but we need to track
# the stable release as per the release notes,
# at the date of the present commit,
# otherwise we won't know which exact
# revision is used by which balenaOS release
# SRCREV="824401fe487d7d3cbcf251bd60270bd7fe8d21d0"

# To use do_configure() provided by poky/meta/recipes-bsp/u-boot/u-boot-configure.inc
# just make the merge_config.sh issue w/out the full path
do_configure:prepend () {
    export PATH=${PATH}:${S}/scripts/kconfig/
}

do_unpack[nostamp] = "1"
do_patch[nostap] = "1"
do_configure[nostamp] = "1"
do_compile[nostamp] = "1"
