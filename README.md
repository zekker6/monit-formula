Monit SaltStack Formula [![Build Status](https://travis-ci.org/alinefr/monit-formula.svg?branch=master)](https://travis-ci.org/alinefr/monit-formula)
=============

This formula is made from [trexglobal/monit-formula](https://github.com/trexglobal/monit-formula/) following [saltstack-formulas/template-formula](https://github.com/saltstack-formulas/template-formula).

To setup Monit.

## What it does

1. Install Monit
2. Setup Monit

## Install

1. Add remotes to /etc/salt/master or /etc/salt/minion if running standalone.

  ```yaml
  gitfs_remotes:
    - git://github.com/alinefr/monit-formula
  ```

2. Setup [pillar](http://docs.saltstack.com/en/latest/topics/pillar/) from pillar.example
3. Add monit to your server [state file](http://docs.saltstack.com/en/latest/topics/tutorials/starting_states.html)

  ```yaml
  include:
      - monit
  ```

  or to the [top.sls](http://docs.saltstack.com/en/latest/ref/states/top.html) file

  ```yaml
  base:
    'some.server.example.com':
      - monit
  ```
