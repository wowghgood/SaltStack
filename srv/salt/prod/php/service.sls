php-running:
  cmd.run:
    - name : cp /data/application/php/etc/php-fpm.conf.default /data/application/php/etc/php-fpm.conf && rm -fr /data/pkg/php-5.6.31 && chkconfig php-fpm on && service php-fpm start
