.DEFAULT_GOAL := all
.PHONY : all install lint test

all: lint test

install:
	python3 -m pip install ansible-lint docker-py

lint: install
	-ansible-lint *.yml

test:
	ansible-playbook -i inventories/test.ini test.yml -e playbook=lan.yml
	ansible-playbook -i inventories/test.ini test.yml -e playbook=local-desktop.yml --limit workstation --skip ignore
