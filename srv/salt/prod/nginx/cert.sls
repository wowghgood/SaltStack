file-cert:
  cmd.run:
    - name: mkdir -p /data/application/nginx/cert
/data/application/nginx/cert:
  file.recurse:
    - source: salt://nginx/files/cert
    - user: root
    - group: root
    - file_mode: 644
    - dir_mode: 755
    - include_empty: Ture
