tomcat-install:
  file.managed:
    - name: /data/pkg/apache-tomcat-7.0.81.tar.gz
    - source: salt://tomcat/files/install_pkg/apache-tomcat-7.0.81.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /data/pkg && tar -zxvf apache-tomcat-7.0.81.tar.gz -C /data/application && cd /data/application  && ln -s apache-tomcat-7.0.81 tomcat && cd /data/application/tomcat/bin && tar -zxvf tomcat-native.tar.gz && cd tomcat-native-1.2.12-src/native && ./configure --with-apr=/data/application/apr --with-java-home=/data/application/java --with-ssl=yes && make && make install && source /etc/profile && rm -fr /data/application/apache-tomcat-7.0.81/webapps/*
    - unless: test -d /data/application/tomcat
    - require:
      - cmd: apr-util-install
      - file: tomcat-install

catalina-file:
  file.managed:
    - name: /data/application/apache-tomcat-7.0.81/bin/catalina.sh
    - source: salt://tomcat/files/conf/catalina.sh
    - user: root
    - group: root
    - mode: 755
    - require:
      - cmd: tomcat-install

server-file:
  file.managed:
    - name: /data/application/apache-tomcat-7.0.81/conf/server.xml
    - source: salt://tomcat/files/conf/server.xml
    - user: root
    - group: root
    - mode: 600
    - require:
      - cmd: tomcat-install
  cmd.run:
    - name: mkdir -p /data/application/apache-tomcat-7.0.81/project
    - require:
      - file: server-file
