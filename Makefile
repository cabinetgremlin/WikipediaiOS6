TARGET = iphone:clang:latest:6.0
ARCHS = armv7

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = WikipediaiOS6
WikipediaiOS6_FILES = src/main.m $(wildcard src/*.m)
WikipediaiOS6_FRAMEWORKS = UIKit Foundation CoreGraphics WebKit

include $(THEOS_MAKE_PATH)/application.mk
