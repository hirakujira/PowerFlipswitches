ARCHS = armv7 arm64
TARGET = iphone:clang::
include ../theos/makefiles/common.mk

BUNDLE_NAME = PFSReboot
PFSReboot_FILES = Switch.xm
PFSReboot_FRAMEWORKS = UIKit
PFSReboot_LIBRARIES = flipswitch
PFSReboot_INSTALL_PATH = /Library/Switches

include ../theos/makefiles/bundle.mk
