ARCHS = armv7 armv7s arm64
TARGET = iphone:clang::6.0
include theos/makefiles/common.mk

TWEAK_NAME = PowerFlipswitches
SUBPROJECTS += PFSRespring
SUBPROJECTS += PFSReboot
SUBPROJECTS += PFSShutdown
SUBPROJECTS += PFSSafemode
SUBPROJECTS += PFSKillBackboard

include $(THEOS_MAKE_PATH)/aggregate.mk

sync: stage
	rsync -e "ssh -p 2222" -z -r .theos/_/Library/Switches/* root@127.0.0.1:/Library/Switches/