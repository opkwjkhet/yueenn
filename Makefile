export THEOS=/var/theos
export CC=ccache gcc
export CXX=ccache g++

ARCHS = arm64
TARGET = iphone:clang:latest:15.0

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

THEOS_PACKAGE_SCHEME = rootless
THEOS_LEAN_AND_MEAN = 1
THEOS_NO_DEFAULTS = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VIGAR

VIGAR_FILES = \
ImGuiDrawView.mm \
Esp/ImGuiLoad.m \
Esp/JHUIViewControllerDecoupler.m \
Esp/DTTJailbreakDetection.m \
Esp/FTNotificationIndicator.m \
Esp/JHDragView.m \
Esp/JHPP.m \
Esp/LoadView.mm \
IMGUI/imgui.cpp \
IMGUI/imgui_draw.cpp \
IMGUI/imgui_tables.cpp \
IMGUI/imgui_widgets.cpp \
IMGUI/imgui_impl_metal.mm \
hook/hook.c \
hook/mach_excServer.c

VIGAR_CFLAGS = -fobjc-arc \
-Wall \
-Wno-deprecated-declarations \
-Wno-unused-variable \
-Wno-unused-value \
-Wno-unused-function \
-fvisibility=hidden

VIGAR_CCFLAGS = -std=c++17 \
-fno-rtti \
-DNDEBUG \
-fvisibility=hidden

VIGAR_FRAMEWORKS = \
UIKit \
Foundation \
Security \
QuartzCore \
CoreGraphics \
CoreText \
AVFoundation \
Accelerate \
GLKit \
SystemConfiguration \
GameController \
Metal \
MetalKit


VIGAR_LDFLAGS += JRMemory.framework/JRMemory

include $(THEOS)/makefiles/tweak.mk