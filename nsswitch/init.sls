{% from "nsswitch/map.jinja" import nsswitch_settings as nsswitch with context %}

nsswitch_config:
  file.managed:
    - name: {{ nsswitch.config_path }}
    - template: jinja
    - source: salt://nsswitch/files/nsswitch.conf
    - mode: {{ nsswitch.config_mode }}

