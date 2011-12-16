SHELL = /bin/sh

TMPDIR=tmp
TOPDIR=$(shell \pwd)
INCDIR=include
SRCDIR=src
LIBDIR=lib
LIBDIRARCH=lib/archive
BINDIR=bin

ifneq (x$(PYTHIA8),x)
ifneq (x$(PYTHIA8DATA),x)

# A few variables used in this Makefile:
EX           := main
EXE          := $(addsuffix .exe,$(EX))
STATICLIB    := $(PYTHIA8)/lib/archive/libpythia8.a
SHAREDLIB    := $(PYTHIA8)/lib/libpythia8.$(SHAREDSUFFIX)
DICTCXXFLAGS := -I$(PYTHIA8)/include 
ROOTCXXFLAGS := $(DICTCXXFLAGS) $(shell root-config --cflags)
FASTJETLOCATION := $(shell fastjet-config --prefix)

# Include Pythia config files
-include $(PYTHIA8)/config.mk
-include config.mk

# LDFLAGS1 for static library, LDFLAGS2 for shared library
LDFLAGS1 := $(shell root-config --ldflags --glibs) \
  -L$(PYTHIA8)/lib/archive -lpythia8 -llhapdfdummy
LDFLAGS2 := $(shell root-config --ldflags --glibs) \
  -L$(PYTHIA8)/lib -lpythia8 -llhapdfdummy

# Default target; make examples (but not shared dictionary)
all: $(EX)

# Rule to build main. Needs static PYTHIA 8 library

ifneq (x$(FASTJETLOCATION),x)
  main: $(PYTHIA8)/$(LIBDIRARCH)/libpythia8.a
	$(CXX) -I$(PYTHIA8)/$(INCDIR) $@.cc \
	`$(FASTJETLOCATION)/bin/fastjet-config --cxxflags --plugins` \
	$(CXXFLAGS) -Wno-shadow \
	-o $@.exe \
	-L$(PYTHIA8)/$(LIBDIRARCH) -lpythia8 -llhapdfdummy \
	-L$(FASTJETLOCATION)/lib \
	`$(FASTJETLOCATION)/bin/fastjet-config --libs --plugins`
	@rm -f $@.o
else
  main:
	@echo ERROR, this target needs Fastjet, variable FASTJETLOCATION
endif #FASTJETLOCATION


else
  main:
	@echo ERROR, there is no PYTHIA8DATA environment variable.
	@echo Set PYTHIA8DATA the "pythia8_install"/xmldoc directory.
endif #PYTHIA8DATA

else
  main:
	@echo ERROR, there is no PYTHIA8 environment variable.
	@echo Set PYTHIA8 the pythia8 installation directory.
endif #PYTHIA8

clean:
	rm -f $(EXE) *.root
	rm *.data
	rm -f *~; rm -f \#*; rm -f core* 

