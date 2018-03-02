include:
  - init.zabbix_rpm
zabbix-agent:
  pkg.installed:
    - name: zabbix-agent
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://init/files/zabbix_agentd.conf
    - template: jinja
    - defaults:
      ZABBIX_SERVER: 192.168.1.190
      AGENT_HOSTNAME: {{ grains['fqdn'] }}
    - require:
      - pkg: zabbix-agent
  service.running:
    - name: zabbix-agent
    - enable: True
    - watch:
      - file: zabbix-agent
      - pkg: zabbix-agent

zabbix_agentd.conf.d:
  file.directory:
    - name: /etc/zabbix/zabbix_agentd.conf.d
    - watch_in:
    - service: zabbix-agent
    - require:
      - pkg: zabbix-agent
      - file: zabbix-agent
