.PHONY: all validate generate build

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

build:
	$(BASHLY) generate --env production
