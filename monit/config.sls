{% from "monit/map.jinja" import monit with context %}

{{ monit.config }}/conf.d/main:
  file.managed:
    - source: salt://monit/files/main
    - template: jinja
    - makedirs: True
    - context:
        http_access: {{ monit.http_access }}

{% if monit.mail_alert is defined %}
/etc/monit/conf.d/mail:
  file.managed:
    - source: salt://monit/files/mail
    - template: jinja
    - context:
      mail_alert: {{ monit.mail_alert }}
{% endif %}
