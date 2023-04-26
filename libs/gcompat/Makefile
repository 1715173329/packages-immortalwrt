# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2023 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=gcompat
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://git.adelielinux.org/adelie/gcompat/-/archive/$(PKG_VERSION)/
PKG_HASH:=82e56d2ecda3f11a93efe61001394a6e5db39c91127d0812d7ad5b0bda558010

PKG_LICENSE:=NCSA
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Tianling Shen <cnsztl@immortalwrt.org>

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(CURDIR)/ld-arch.mk

define Package/gcompat
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=The GNU C Library Compatibility Layer for Adélie Linux
  URL:=https://git.adelielinux.org/adelie/gcompat
  DEPENDS:=@USE_MUSL @!arc +libucontext +musl-obstack
endef

define Package/gcompat/description
  This distribution contains the implementation of gcompat, a library
  which provides glibc-compatible APIs for use on musl libc systems.

  This library is designed to be used for binaries that are already
  compiled against glibc. It does not contain any headers, and cannot
  be used to build software that requires glibc. It is instead
  recommended that any software that requires glibc APIs be modified
  to become more portable.

  This library can optionally be compiled with other libraries to make
  a single, unfied solution. This can include fts, libucontext, obstack,
  and others.

  gcompat additionally provides a loader stub. This is a small library
  that has the same name as the glibc dynamic linker on glibc platforms;
  when a binary is run that uses glibc as its dynamic linker, the stub
  will run, redirecting it to use musl and automatically preloading the
  gcompat library.
endef

MAKE_FLAGS+= \
	WITH_LIBUCONTEXT=1 \
	WITH_OBSTACK="musl-obstack" \
	LINKER_PATH="/lib/ld-musl-$(LD_ARCH).so.1" \
	LOADER_NAME="$(LD_NAME)"

define Package/gcompat/install
	$(INSTALL_DIR) $(1)/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/libgcompat.so* $(1)/lib/
	$(CP) $(PKG_INSTALL_DIR)/lib/$(LD_NAME) $(1)/lib/
endef

$(eval $(call BuildPackage,gcompat))
