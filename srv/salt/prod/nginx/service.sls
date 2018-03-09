service-running:
  cmd.run:
    - name : service nginx start
    - require:
      - cmd: add-service
