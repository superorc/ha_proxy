Role Name
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

- Testing: vagrant, virtualbox, ansible
- Prod: None

Local tests
-----------
    $ ./run_local_test.sh
    
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
