TARGET = iphone:clang:13.0:6.0
ARCHS = armv7

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = WikipediaiOS6
WikipediaiOS6_FILES = src/main.m $(wildcard src/*.m)
WikipediaiOS6_FRAMEWORKS = UIKit Foundation CoreGraphics WebKit

# Force clean compiler flags and bypass missing platform stubs
WikipediaiOS6_CFLAGS = -fno-modules -Wno-deprecated-module-dot-map -Wno-error
WikipediaiOS6_LDFLAGS = -undefined dynamic_lookup

include $(THEOS_MAKE_PATH)/application.mk
