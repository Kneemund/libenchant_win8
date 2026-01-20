# Compiler and flags
CXX := g++
CXXFLAGS := -shared -fPIC -Wall -Wextra
PKG_CONFIG := pkg-config

# Windows API version flags (Windows 8+ required for Spell Checking API)
WIN_VERSION_FLAGS := -D_WIN32_WINNT=_WIN32_WINNT_WIN8 -DNTDDI_VERSION=NTDDI_WIN8

# Windows COM libraries
WIN_LIBS := -lole32 -loleaut32 -luuid

# Packages
PACKAGES := glib-2.0 enchant-2

# Include directories
INCLUDES := -Ienchant/lib

# Source and output
SRC := src/win8_provider.cpp
TARGET := libenchant_win8.dll

# Get flags from pkg-config
PKG_CFLAGS := $(shell $(PKG_CONFIG) --cflags $(PACKAGES))
PKG_LIBS := $(shell $(PKG_CONFIG) --libs $(PACKAGES))

. PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(WIN_VERSION_FLAGS) $(INCLUDES) $(PKG_CFLAGS) -o $@ $< $(PKG_LIBS) $(WIN_LIBS)

clean:
	rm -f $(TARGET)
