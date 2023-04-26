ifeq ($(ARCH),arm)
  ifdef HAS_FPU
    LD_ARCH:=armhf
    LD_NAME:=ld-linux-armhf.so.3
  else
    LD_ARCH:=arm
    LD_NAME:=ld-linux.so.3
  endif
else ifeq ($(ARCH),aarch64)
  LD_ARCH:=aarch64
  LD_NAME:=ld-linux-aarch64.so.1
else ifeq ($(ARCH),mips)
  ifdef HAS_FPU
    LD_ARCH:=mips
  else
    LD_ARCH:=mips-sf
  endif
  LD_NAME:=ld.so.1
else ifeq ($(ARCH),mips64)
  ifdef HAS_FPU
    LD_ARCH:=mips64
  else
    LD_ARCH:=mips64-sf
  endif
  LD_NAME:=ld.so.1
else ifeq ($(ARCH),mipsel)
  ifdef HAS_FPU
    LD_ARCH:=mipsel
  else
    LD_ARCH:=mipsel-sf
  endif
  LD_NAME:=ld.so.1
else ifeq ($(ARCH),mips64el)
  ifdef HAS_FPU
    LD_ARCH:=mips64el
  else
    LD_ARCH:=mips64el-sf
  endif
  LD_NAME:=ld.so.1
else ifeq ($(ARCH),powerpc)
  ifdef HAS_FPU
    LD_ARCH:=powerpc
  else
    LD_ARCH:=powerpc-sf
  endif
  LD_NAME:=ld.so.1
else ifeq ($(ARCH),powerpc64)
  ifdef HAS_FPU
    LD_ARCH:=powerpc64
  else
    LD_ARCH:=powerpc64-sf
  endif
  LD_NAME:=ld64.so.2
else ifeq ($(ARCH),i386)
  LD_ARCH:=i386
  LD_NAME:=ld-linux.so.2
else ifeq ($(ARCH),x86_64)
  LD_ARCH:=x86_64
  LD_NAME:=ld-linux-x86-64.so.2
endif
