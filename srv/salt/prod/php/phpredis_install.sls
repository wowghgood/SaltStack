redis-install:
  file.managed:
    - name: /data/pkg/phpredis-2.2.5.tar.gz
    - source: salt://php/files/install_pkg/phpredis-2.2.5.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /data/pkg/ && tar -zxf phpredis-2.2.5.tar.gz && cd phpredis-2.2.5 && /data/application/php/bin/phpize && ./configure --with-php-config=/data/application/php/bin/php-config && make && make install && rm -rf ../phpredis-2.2.5
    - require:
      - cmd: php-install
      - file: redis-install
