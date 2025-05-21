.PHONY: all validate generate 

BASHLY = docker run --rm -it --user $(shell id -u):$(shell id -g) --volume "$(CURDIR):/app" dannyben/bashly

all: validate generate

validate:
	$(BASHLY) validate

generate:
	$(BASHLY) generate
