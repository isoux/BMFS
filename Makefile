#!/bin/make -f

.PHONY: all
all:
	$(MAKE) -C src all
	cp --update src/bmfs bmfs
ifndef NO_FUSE
	cp --update src/bmfs-fuse bmfs-fuse
endif

.PHONY: clean
clean:
	$(MAKE) -C src clean
	$(RM) bmfs bmfs-fuse

.PHONY: help
help:
	@echo "Relevant variables:"
	@echo "  BMFS_RELEASE - enables full optimization of code"
	@echo "  NO_VALGRIND  - does not use valgrind to run tests"
	@echo "  NO_FUSE      - prevents bmfs-fuse from being built"
	@echo "Targets"
	@echo "  all       - builds all tests and programs"
	@echo "  clean     - removes all files generated by makefile"
	@echo "  test      - runs all tests (uses valgrind by default)"
	@echo "  install   - installs programs"

.PHONY: test
test:
	$(MAKE) -C src test

.PHONY: install
install:
	$(MAKE) -C src install

