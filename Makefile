# https://www.gnu.org/software/make/

DEVD ?= devd
HUGO ?= hugo
MODD ?= modd
PERU ?= peru
RSYNC ?= rsync

SRC_DIR = .
BLD_DIR = public

deps:
	$(PERU) sync

dev-server:
	$(DEVD) $(DEVD_OPTS)

build: deps
	mkdir -p $(BLD_DIR)
	$(RSYNC) -avP --delete $(SRC_DIR)/static/* $(BLD_DIR)/
	$(HUGO) $(HUGO_OPTS)

netlify-env:
	pip install peru

netlify-build: netlify-env
	$(MAKE) build

watch:
	$(MODD)

clean:
	$(PERU) clean
	rm -rf $(BLD_DIR)
