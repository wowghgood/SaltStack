/usr/lib/python2.7/site-packages/salt/modules/parted.py:
  file.managed:
    - source: salt://init/files/parted.py
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: mkdir -p /data/application /data/log /data/script /data/pkg
