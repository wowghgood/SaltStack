base:
  '*':
    - init.env_init
prod:
  'Nginx-Proxy_*':
    - nginx.install
  'Nginx-app_*'
    - nginx.install
    - php.install
