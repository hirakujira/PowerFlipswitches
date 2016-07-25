ARCHS = armv7 arm64
TARGET = iphone:clang::
include theos/makefiles/common.mk

TWEAK_NAME = PowerFlipswitches
SUBPROJECTS += PFSRespring
SUBPROJECTS += PFSReboot
SUBPROJECTS += PFSShutdown
SUBPROJECTS += PFSSafemode

include $(THEOS_MAKE_PATH)/aggregate.mk

sync: stage
	rsync -e "ssh -p 2222" -z -r .theos/_/Library/Switches/* root@127.0.0.1:/Library/Switches/