include:
  - nginx.user
  - nginx.pkg

nginx-install:
  file.managed:
    - name: /data/application/nginx-1.12.1.tar.gz
    - source: salt://nginx/files/nginx-1.12.1.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /data/application && tar -zxf nginx-1.12.1.tar.gz && cd nginx-1.12.1 && ./configure --prefix=/data/application/nginx --user=nginx --group=nginx --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-http_addition_module --with-http_gzip_static_module --with-http_stub_status_module --with-pcre --with-stream  && make && make install && chown -R nginx:nginx /data/application/nginx
    - unless: test -d /data/application/nginx
    - require:
      - user: nginx-user_group
      - file: nginx-install
      - pkg: nginx-pkg
