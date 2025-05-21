.PHONY: all validate generate build release

BASHLY = docker run \
				 --rm \
				 -it \
				 --user $(shell id -u):$(shell id -g) \
				 --volume "$(CURDIR):/app" \
				 dannyben/bashly


# development -----------------------------------------------------------------

all: validate generate

validate:
	$(BASHLY) validate

generate:
	$(BASHLY) generate


# production ------------------------------------------------------------------

build: validate
	$(BASHLY) generate --env production


# release ---------------------------------------------------------------------

docs:
	$(BASHLY) render :mandoc docs/man
	$(BASHLY) render :markdown docs/md

release: build docs
