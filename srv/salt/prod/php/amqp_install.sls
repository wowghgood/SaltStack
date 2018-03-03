rabbitmqc-install:
  file.managed:
    - name: /data/pkg/rabbitmq-c-0.5.0.tar.gz
    - source: salt://php/files/install_pkg/rabbitmq-c-0.5.0.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /data/pkg/ && tar -zxf rabbitmq-c-0.5.0.tar.gz && cd rabbitmq-c-0.5.0 && ./configure --prefix=/data/application/rabbitmq-c && make && make install && rm -rf ../rabbitmq-c-0.5.0
    - require:
      - file: rabbitmqc-install

amqp-install:
  file.managed:
    - name: /data/pkg/amqp-1.6.1.tgz
    - source: salt://php/files/install_pkg/amqp-1.6.1.tgz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /data/pkg/ && tar -zxf amqp-1.6.1.tgz && cd amqp-1.6.1 && /data/application/php/bin/phpize && ./configure --with-php-config=/data/application/php/bin/php-config --with-amqp --with-librabbitmq-dir=/data/application/rabbitmq-c/ && make && make install && rm -rf ../amqp-1.6.1
    - require:
      - cmd: rabbitmqc-install
      - file: amqp-install
