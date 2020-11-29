PLAYBOOK = lan.yml
TAGS = all
LIMIT = all
SKIP = none
OPTS = -vvvv

.DEFAULT_GOAL := all
.PHONY : all install lint test

all: lint test

install:
	python3 -m pip install ansible-lint docker
	# ansible-galaxy install -r requirements.yml
	ansible-galaxy  collection install community.docker -p collections
	ansible-galaxy  collection install community.general -p collections

lint:
	-ansible-lint $(PLAYBOOK)

test:
	ansible-playbook -i inventories/test.ini test.yml -e playbook=$(PLAYBOOK) --limit $(LIMIT) --tags test-wrapper,$(TAGS) --skip-tags ignore,$(SKIP) $(OPTS)
