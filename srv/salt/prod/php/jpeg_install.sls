jpeg-install:
  file.managed:
    - name: /data/pkg/jpegsrc.v9b.tar.gz
    - source: salt://php/files/install_pkg/jpegsrc.v9b.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /data/pkg && tar -zxf jpegsrc.v9b.tar.gz && cd jpeg-9b && ./configure --prefix=/usr/local/jpeg --enable-shared && make && make install && rm -fr ../jpeg-9b
    - require:
      - file: jpeg-install
