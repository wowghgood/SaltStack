zabbix_release:
  pkg.installed:
    - sources:
      - zabbix-release: http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm
    - unless: rpm -qa | grep zabbix-release-3.4-2.el7
