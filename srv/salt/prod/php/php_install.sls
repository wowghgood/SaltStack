php-install:
  file.managed:
    - name: /data/pkg/php-5.6.31.tar.gz
    - source: salt://php/files/install_pkg/php-5.6.31.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /data/pkg && tar -zxf php-5.6.31.tar.gz && cd php-5.6.31 && ./configure --prefix=/data/application/php --with-config-file-path=/data/application/php/etc --enable-fpm --enable-pcntl --enable-mysqlnd --enable-opcache --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-shmop --enable-zip --enable-ftp --enable-soap --enable-xml --enable-mbstring --disable-rpath --disable-debug --disable-fileinfo --with-mysql --with-mysqli --with-pdo-mysql --with-pcre-regex --with-iconv --with-zlib --with-mcrypt --with-gd --with-openssl --with-mhash --with-xmlrpc --with-curl --with-imap-ssl --with-jpeg-dir && make && make install && cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm && chkconfig --add php-fpm && chmod 755 /etc/init.d/php-fpm && chkconfig nginx on
    - require:
      - file: php-install

opcache-install:
  cmd.run:
    - name: cd /data/pkg/php-5.6.31/ext/opcache && /data/application/php/bin/phpize && ./configure --with-php-config=/data/application/php/bin/php-config && make && make install
    - require:
      - cmd: php-install
  file.managed:
    - name: /data/application/php/etc/php.ini
    - source: salt://php/files/conf/php.ini
    - user: root
    - group: root
    - mode: 644
    - require:
      - cmd: amqp-install
