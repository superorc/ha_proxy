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

- Testing: vagrant, virtualbox, ansible # control machine (dev stanok)
- Prod: None

Local tests
-----------
Duration is around 2 minutes with 2 VMs.

      $ time ./run_local_test.sh

To add more VM's update tests/Vagrantfile and run_local_test.sh

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
