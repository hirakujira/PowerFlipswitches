ARCHS = armv7 arm64
TARGET = iphone:clang::
include ../theos/makefiles/common.mk

BUNDLE_NAME = PFSSafemode
PFSSafemode_FILES = Switch.xm
PFSSafemode_FRAMEWORKS = UIKit
PFSSafemode_LIBRARIES = flipswitch
PFSSafemode_INSTALL_PATH = /Library/Switches

include ../theos/makefiles/bundle.mk
