/data/application/nginx/conf:
  file.recurse:
    - source: salt://nginx/files/conf
    - user: root
    - group: root
    - file_mode: 644
    - dir_mode: 755
    - include_empty: Ture
