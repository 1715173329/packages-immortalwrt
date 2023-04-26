# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2023 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=libucontext
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kaniini/libucontext/tar.gz/$(PKG_NAME)-$(PKG_VERSION)?
PKG_HASH:=937fba9d0beebd7cf957b79979b19fe3a29bb9c4bfd25e869477d7154bbf8fd3
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Tianling Shen <cnsztl@immortalwrt.org>

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libucontext
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=ucontext implementation featuring glibc-compatible ABI
  URL:=https://github.com/kaniini/libucontext
  DEPENDS:=@USE_MUSL
endef

define Package/libucontext/description
  libucontext is a library which provides the ucontext.h C API. Unlike
  other implementations, it faithfully follows the kernel process ABI
  when doing context swaps.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libucontext $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libucontext* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libucontext.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libucontext/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libucontext*.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libucontext))
