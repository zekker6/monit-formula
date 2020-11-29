{% from "monit/map.jinja" import monit with context %}


{%- for module, module_v in monit.modules.items() -%}

{{ module }}_monitor:
  monit.monitor:
  - name: {{ module }}

{% endfor %}