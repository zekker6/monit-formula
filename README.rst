===================================
Monit SaltStack Formula |travis-ci|
===================================
.. |travis-ci| image:: https://travis-ci.org/alinefr/monit-formula.svg?branch=master
    :target: https://travis-ci.org/alinefr/monit-formula

This formula is made from `trexglobal/monit-formula`_ following `saltstack-formulas/template-formula`_

.. _trexglobal/monit-formula: https://github.com/trexglobal/monit-formula
.. _saltstack-formulas/template-formula: https://github.com/saltstack-formulas/template-formula

To setup Monit
==============

.. contents::
    :local:

``Install monit``
-----------------

Add remotes to /etc/salt/master or /etc/salt/minion if running standalone.

.. code:: yaml

  gitfs_remotes:
    - git://github.com/alinefr/monit-formula

``Setup monit``
---------------

Setup pillar_ from pillar.example.

.. _pillar: http://docs.saltstack.com/en/latest/topics/pillar/


Add monit to your server `state file`_

.. _state file: http://docs.saltstack.com/en/latest/topics/tutorials/starting_states.html

.. code:: yaml

    include:
      - monit

or to the top.sls_ file.

.. _top.sls: http://docs.saltstack.com/en/latest/ref/states/top.html

.. code:: yaml

    base:
      'some.server.example.com':
        - monit


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

Add initial monit configuration.

``monit.config-ng``
-------------------

Experimental by service configuration. 

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
          if_failed: 
            host: 127.0.0.1 port 80 protocol http
            action: restart

It generates the following config:

.. code::

    check process nginx with pidfile /var/run/nginx.pid
      group www
      start program = "/etc/init.d/nginx start"
      stop program = "/etc/init.d/nginx stop"
      if failed host 127.0.0.1 port 80 protocol http then restart

  
``monit.service``
-----------------

Ensures the monit service is up and running. 
