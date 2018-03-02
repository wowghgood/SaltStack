base:
  '*':
    - init.env_init
prod:
  'Saltstack-Master':
    - nginx.pkg
