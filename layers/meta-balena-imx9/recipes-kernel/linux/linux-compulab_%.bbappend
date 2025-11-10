FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

inherit kernel-balena

SRC_URI:append = " \
    file://compulab-mx93-extra.cfg \
"

BALENA_CONFIGS:append = " imx-sdma "
BALENA_CONFIGS[imx-sdma] = " \
	CONFIG_IMX_SDMA=m \
"

# Ensure this module is built-in otherwise we get this error:
# Error:
# Problem: package kernel-module-nxp-wlan-git-r0.ucm_imx93 from oe-repo requires kernel-module-moal-6.6.52-3.0-gdf747cfac8c0, but none of the providers can be installed
#  - conflicting requests
#  - nothing provides kernel-module-cfg80211-6.6.52-3.0-gdf747cfac8c0 needed by kernel-module-moal-6.6.52-3.0-gdf747cfac8c0-git-r0.ucm_imx93 from oe-repo
# (try to add '--skip-broken' to skip uninstallable packages)
BALENA_CONFIGS:append = " cf80211 "
BALENA_CONFIGS[cf80211] = " \
	CONFIG_CFG80211=y \
"

# We don't load grub with u-boot, instead
# balenaOS u-boot loads the kernel directly
BALENA_CONFIGS:append = " noefi "
BALENA_CONFIGS[noefi] = " \
	CONFIG_EFI_STUB=n \
	CONFIG_EFI=n \
"

# The reference image does not have ar1335 enabled
# so we disable this as well to avoid long messages
# caused by probe errors.
BALENA_CONFIGS:append = " noar1335 "
BALENA_CONFIGS[noar1335] = " \
	CONFIG_MXC_CAMERA_AR1335=n \
	CONFIG_MXC_CAMERA_AR1335_AF=n \
	CONFIG_MXC_CAMERA_AR1335_MCU=n \
"
