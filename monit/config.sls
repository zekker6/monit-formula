{% from "monit/map.jinja" import monit with context %}

{{ monit.config }}:
  file.managed:
    - source: salt://monit/files/main
    - template: jinja
    - makedirs: True
    - context:
        http_access: {{ monit.http_access }}

{% if monit.mail_alert is defined %}
{{ monit.config_includes }}/mail:
  file.managed:
    - source: salt://monit/files/mail
    - template: jinja
    - makedirs: True
    - context:
      mail_alert: {{ monit.mail_alert }}
{% endif %}
