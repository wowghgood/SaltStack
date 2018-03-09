apr-util-install:
  file.managed:
    - name: /data/pkg/apr-util-1.6.1.tar.gz
    - source: salt://apr/files/install_pkg/apr-util-1.6.1.tar.gz
    - user: root
    - group: root
    - mode: 644
  pkg.installed:
    - pkgs:
      - expat-devel
  cmd.run:
    - name: cd /data/pkg && tar -zxf apr-util-1.6.1.tar.gz && cd apr-util-1.6.1 && ./configure --prefix=/data/application/apr-util --with-apr=/data/application/apr && make && make install && rm -fr ../apr-util-1.6.1
    - unless: test -d /data/application/apr-util
    - require:
      - cmd: apr-install
      - file: apr-util-install
