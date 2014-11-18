{% from "monit/map.jinja" import monit with context %}

monit_pkg:
  pkg.installed:
    - name: monit

/etc/init/monit.conf:
  file.managed:
    - source: salt://monit/files/monit.conf
    - user: root
    - group: root
    - mode: 0444

/etc/monit/conf.d:
  file.directory:
    - user: root
    - group: root
    - mode: 0755

/etc/monit/conf.d/main:
  file.managed:
    - source: salt://monit/files/main
    - user: root
    - group: root
    - mode: 0444
    - template: jinja
    - context: 
      port: {{ monit.port }}

{% if pillar['monit']['mail_alert'] is defined %}
/etc/monit/conf.d/mail:
  file.managed:
    - source: salt://monit/files/mail
    - user: root
    - group: root
    - mode: 0444
    - template: jinja
{% endif %}

monit:
  service.running:
    - enable: True
    - restart: True
    - require:
      - pkg: monit
      - file: /etc/init/monit.conf
      - file: /etc/monit/conf.d/main
      {% if pillar['monit']['mail_alert'] is defined %}- file: /etc/monit/conf.d/mail{% endif %}
    - watch:
      - file: /etc/monit/conf.d/*
