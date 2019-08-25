.DEFAULT_GOAL := all
.PHONY : all install lint test

all: lint test

install:
	python3 -m pip install --user pipx

lint: install
	-pipx run ansible-lint *.yml

test:
	ansible-playbook -i test-inventory.ini test-lan.yml
