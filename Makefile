
.PHONY: provision

PRIVATE_IP := $(shell cat Vagrantfile | grep private_network | awk '{print $$4}')

provision:
	vagrant up
.PHONY: provision

env:
	@echo 'export DOCKER_HOST=$(PRIVATE_IP):2375'
.PHONY: env