TARGET = iphone:clang:9.3:6.0
ARCHS = armv7

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = WikipediaiOS6
WikipediaiOS6_FILES = src/main.m $(wildcard src/*.m)
WikipediaiOS6_FRAMEWORKS = UIKit Foundation CoreGraphics WebKit

# Disable Modules and ignore module map warnings on modern Clang
WikipediaiOS6_CFLAGS = -fno-modules -Wno-deprecated-module-dot-map -Wno-error
WikipediaiOS6_LDFLAGS = -Wno-deprecated-module-dot-map

include $(THEOS_MAKE_PATH)/application.mk
