.DEFAULT_GOAL := all
.PHONY : all install lint test

all: lint test

install:
	python3 -m pip install ansible-lint docker-py

lint:
	-ansible-lint $(PLAYBOOK).yml

test:
	ansible-playbook -i inventories/test.ini test.yml -e playbook=$(PLAYBOOK) --skip ignore

