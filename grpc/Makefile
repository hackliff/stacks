# Makefile
# vim:ft=make

include ./Go.mk

gopath.setup:
	mkdir -p $(GOPATH)/src/github.com/$(GIT_USER)
	ln -s $(PWD) $(GOPATH)/src/github.com/$(GIT_USER)/$(PROJECT)

gopath.teardown:
	unlink $(GOPATH)/src/github.com/$(GIT_USER)/$(PROJECT)

