java-install:
  file.managed:
    - name: /data/pkg/jdk-7u80-linux-x64.tar.gz
    - source: salt://java/files/install_pkg/jdk-7u80-linux-x64.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /data/pkg && tar -zxf jdk-7u80-linux-x64.tar.gz -C /data/application && cd /data/application && ln -s jdk1.7.0_80 java
    - unless: test -d /data/application/java
    - require:
      - file: java-env
      - file: java-install
