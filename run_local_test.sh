#!/bin/bash
# run virtualbox VM's, apply role twice, destroy VM's

#exit if any non 0
set -oe pipefail

# bootstrap local VM's via virtualbox
cd tests && timeout 5m vagrant up node1 node2 #node3
# or just run all VMs with vagrant up

# apply role
timeout 2m ansible-playbook -i inventory-local test.yml -vv

# Idempotence check
# Run the role/playbook again, checking to make sure it's idempotent.
ansible-playbook -i inventory-local test.yml -vv | grep -q 'changed=0.*failed=0' \
  && (echo '******************************') \
  && (echo 'Idempotence test') \
  && (echo '******************************') \
  && (echo 'passed' && exit 0) \
  || (echo '******************************') \
  || (echo 'FAILED' && exit 1) \
  || (echo '******************************')

# terminate tests VM's
# uncomment below to destroy local VM's
#vagrant destroy --force

echo 'Done.. See results above'
