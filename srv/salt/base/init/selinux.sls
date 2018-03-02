disabled_selinux:
  file.replace:
    - name: /etc/selinux/config
    - pattern: SELINUX=enforcing
    - repl: SELINUX=disabled
