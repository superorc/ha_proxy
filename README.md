ha_proxy
=========

Install haproxy on centos7 with default config

Requirements
------------

Centos 7

Role Variables
--------------

None

Dependencies
------------

- Testing/Development: vagrant, virtualbox, ansible # control machine (dev stanok)

      pip install -r requirements.txt --user

- Prod: None

Local tests
-----------
Duration is around 2 minutes with 2 VMs.

      $ time ./run_local_test.sh

To add more VM's update tests/Vagrantfile and run_local_test.sh

#### Molecule
      $ molecule create
      $ molecule converge
      $ molecule idempotence
      $ molecule verify
      # need automate it

Example Playbook
----------------
    $ ansible-playbook -i inventory ha_proxy.yml -vv

    ---
    - hosts:
        - node1
        - node2

      roles:
      - ha_proxy

      become: yes

License
-------

BSD
