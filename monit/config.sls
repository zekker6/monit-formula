{% from "monit/map.jinja" import monit with context %}

{#- This is the main configuration file #}
{{ monit.config }}:
  file.managed:
    - source: salt://monit/files/monitrc
    - template: jinja
    - makedirs: True
    - mode: '0700'
    - context:
        config_includes: {{ monit.config_includes | json }}
        http_access: {{ monit.http_access | json }}
        daemon_check: {{ monit.daemon_check }}

{#- This is the mail alert configuration #}
{% if monit.mail_alert is defined %}
{{ monit.config_includes }}/mail:
  file.managed:
    - source: salt://monit/files/mail
    - template: jinja
    - makedirs: True
    - context:
      mail_alert: {{ monit.mail_alert | json }}
{% endif %}

{#- This is populated by modules configuration
    from the contents of pillar. #}
{{ monit.config_includes }}/modules:
  file.managed:
    - source: salt://monit/files/modules
    - template: jinja
    - context:
      modules: {{ monit.modules | json }}
