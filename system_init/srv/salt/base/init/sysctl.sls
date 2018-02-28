/etc/sysctl.conf:
  file.managed:
    - source: salt://init/files/sysctl.conf
    - user: root
    - group: root
    - mode: 644
