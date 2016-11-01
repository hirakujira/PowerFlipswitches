ARCHS = armv7 arm64
TARGET = iphone:clang::6.0
include ../theos/makefiles/common.mk

BUNDLE_NAME = PFSKillBackboard
PFSKillBackboard_FILES = Switch.xm
PFSKillBackboard_FRAMEWORKS = UIKit
PFSKillBackboard_LIBRARIES = flipswitch
PFSKillBackboard_INSTALL_PATH = /Library/Switches

include ../theos/makefiles/bundle.mk
