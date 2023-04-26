# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2023 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=musl-obstack
PKG_VERSION:=1.2.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/void-linux/musl-obstack/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=9ffb3479b15df0170eba4480e51723c3961dbe0b461ec289744622db03a69395

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Tianling Shen <cnsztl@immortalwrt.org>

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/musl-obstack
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=A standalone library to implement GNU libc's obstack
  URL:=https://github.com/void-linux/musl-obstack
  DEPENDS:=@USE_MUSL
endef

define Package/musl-obstack/description
  The musl-obstack package is a copy + paste of the obstack functions
  and macros found in GNU gcc libiberty library for use with musl libc.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/include/obstack.h $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libobstack* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/musl-obstack.pc $(1)/usr/lib/pkgconfig/
endef

define Package/musl-obstack/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libobstack.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,musl-obstack))
