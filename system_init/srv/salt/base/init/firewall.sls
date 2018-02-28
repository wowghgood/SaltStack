firewall_close:
  cmd.run:
    - name: systemctl stop firewalld.service

firewall_init_off:
  cmd.run:
    - name: systemctl disable firewalld.service
