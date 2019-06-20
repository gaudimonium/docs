# https://www.gnu.org/software/make/

HUGO ?= hugo
PERU ?= peru

SRC_DIR = .
BLD_DIR = public

deps:
	$(PERU) sync

build:
	mkdir -p $(BLD_DIR)
	rsync -avP --delete $(SRC_DIR)/static/* $(BLD_DIR)/
	$(HUGO)

netlify-env:
	pip install peru

netlify-build: netlify-env
	$(MAKE) build

clean:
	rm -rf $(BLD_DIR)
