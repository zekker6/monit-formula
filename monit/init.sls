monit_pkgs:
  pkg.installed:
    - names:
      - monit

/etc/init/monit.conf:
  file:
    - managed
    - source: salt://monit/files/monit/etc/init/monit.conf
    - user: root
    - group: root
    - mode: 0444

/etc/monit/conf.d:
  file.directory:
    - user: root
    - group: root
    - mode: 0755

/etc/monit/conf.d/main:
  file:
    - managed
    - source: salt://monit/files/monit/etc/monit/conf.d/main
    - user: root
    - group: root
    - mode: 0444

/etc/monit/conf.d/mail:
  file:
    - managed
    - source: salt://monit/files/monit/etc/monit/conf.d/mail
    - user: root
    - group: root
    - mode: 0444
    - template: jinja

monit:
  service:
    - running
    - enable: True
    - restart: True
    - require:
      - pkg: monit
      - file: /etc/init/monit.conf
      - file: /etc/monit/conf.d/main
      - file: /etc/monit/conf.d/mail
    - watch:
      - file: /etc/monit/conf.d/*
