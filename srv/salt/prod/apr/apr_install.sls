apr-install:
  file.managed:
    - name: /data/pkg/apr-1.6.3.tar.gz
    - source: salt://apr/files/install_pkg/apr-1.6.3.tar.gz
    - user: root
    - group: root
    - mode: 644

  cmd.run:
    - name: cd /data/pkg && tar -zxf apr-1.6.3.tar.gz && cd apr-1.6.3 && ./configure --prefix=/data/application/apr && make && make install && rm -fr ../apr-1.6.3
    - unless: test -d /data/application/apr
    - require:
      - cmd: java-install
      - file: apr-install
