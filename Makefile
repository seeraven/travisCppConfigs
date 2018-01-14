#
# Makefile for travisCppConfigs.
#

all: build

info:
	@echo "System information:"
	@echo " CC:    $(CC)"
	@echo " CXX:   $(CXX)"
	@echo " GCC:   $(shell gcc -dumpversion)"
	@echo " Clang: $(shell clang --version | grep version | awk '{print $$3}')"
	@echo " NVCC:  $(shell nvcc --version | grep -oP 'V[0-9.]+')"

build: info
	@echo "Building..."

test: info
	@echo "Testing..."
