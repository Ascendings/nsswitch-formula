{% from "nsswitch/map.jinja" import nsswitch_settings as nsswitch with context %}

{% if nsswitch.package_name %}
nsswitch_package:
  pkg.installed:
    - name: {{ nsswitch.package_name }}
    - require_in:
      - file: nsswitch_config
{% endif %}

nsswitch_config:
  file.managed:
    - name: {{ nsswitch.config_path }}
    - template: jinja
    - source: salt://nsswitch/files/nsswitch.conf
    - mode: {{ nsswitch.config_mode }}

