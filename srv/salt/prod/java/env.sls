java-env:
  file.append:
    - name: /etc/profile
    - text:
      - export JAVA_HOME=/data/application/java
      - export PATH=$JAVA_HOME/bin:$PATH
      - export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
      - export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/application/apr/lib
