#!/bin/bash

# bootstrap local VM's via virtualbox
cd tests && vagrant up node1 node2

# apply role
ansible-playbook -i inventory-local test.yml -vv

# Idempotence check
# Run the role/playbook again, checking to make sure it's idempotent.
ansible-playbook -i inventory-local test.yml -vv | grep -q 'changed=0.*failed=0' \
  && (echo 'Idempotence test: pass' && exit 0) \
  || (echo 'Idempotence test: fail' && exit 1)

# terminate tests VM's
# uncomment below to destroy local VM's
#vagrant destroy --force
