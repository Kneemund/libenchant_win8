# Compiler and flags
CXX := g++
CXXFLAGS := -shared -fPIC -Wall -Wextra
PKG_CONFIG := pkg-config

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
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(PKG_CFLAGS) -o $@ $< $(PKG_LIBS) -lole32 -loleaut32 -luuid

clean:
	rm -f $(TARGET)
