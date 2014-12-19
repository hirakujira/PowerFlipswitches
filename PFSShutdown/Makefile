ARCHS = armv7 arm64
TARGET = iphone:clang::
include ../theos/makefiles/common.mk

BUNDLE_NAME = PFSShutdown
PFSShutdown_FILES = Switch.xm
PFSShutdown_FRAMEWORKS = UIKit
PFSShutdown_LIBRARIES = flipswitch
PFSShutdown_INSTALL_PATH = /Library/Switches

include ../theos/makefiles/bundle.mk
