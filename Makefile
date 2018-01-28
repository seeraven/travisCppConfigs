#
# Makefile for travisCppConfigs.
#

all: build

info:
	@echo "System information:"
	@echo " CC:    $(CC)  $(shell $(CC) -dumpversion)"
	@echo " CXX:   $(CXX) $(shell $(CC) -dumpversion)"
	@echo " NVCC:  $(shell nvcc --version | grep -oP 'V[0-9.]+')"

build: info
	@echo "Building..."

test: info
	@echo "Testing..."
