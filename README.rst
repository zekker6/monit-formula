===================================
Monit SaltStack Formula |travis-ci|
===================================
.. |travis-ci| image:: https://travis-ci.org/alinefr/monit-formula.svg?branch=master
    :target: https://travis-ci.org/alinefr/monit-formula

This formula is made from `trexglobal/monit-formula`_ following `saltstack-formulas/template-formula`_

.. _trexglobal/monit-formula: https://github.com/trexglobal/monit-formula
.. _saltstack-formulas/template-formula: https://github.com/saltstack-formulas/template-formula

Available states
================

.. contents::
    :local:

``monit``
---------

Installs monit.

``monit.install``
-----------------

Installs monit.

``monit.config``
----------------

Add initial monit configuration and also supports by service configuration. 

Example:

.. code:: yaml

    modules:
      nginx:
        process: 
          with:
            pidfile: /var/run/nginx.pid
          config:
            group: www
            start: "/etc/init.d/nginx start"
            stop: "/etc/init.d/nginx stop"
          if: 
            failed: host 127.0.0.1 port 80 protocol http
            action: restart

It generates the following config:

.. code::

    check process nginx with pidfile /var/run/nginx.pid
      group www
      start program = "/etc/init.d/nginx start"
      stop program = "/etc/init.d/nginx stop"
      if failed host 127.0.0.1 port 80 protocol http then restart

Sometimes you may need more than one configuration block for the 
same name. If so you can add a custom name.

.. code:: yaml

    modules:
      nginx_init:
        process: 
          custom:
            name: nginx
          with:
            pidfile: /var/run/nginx.pid
          config:
            group: www
            start: "/etc/init.d/nginx start"
            stop: "/etc/init.d/nginx stop"
          if: 
            failed: host 127.0.0.1 port 80 protocol http
            action: restart

The result is exacly the same as the configuration shown before.

Check `pillar.example`_ for full usage.

.. _pillar.example: pillar.example
  
``monit.service``
-----------------

Ensures the monit service is up and running. 
