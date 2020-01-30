import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_haproxy_service(host):
    service = host.service("haproxy")

    assert service.is_running
    assert service.is_enabled
