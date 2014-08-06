Monit SaltStack Formula
=============

To setup Monit.

## What it does

1. Install Monit
2. Setup Monit

## Install

1. Add remotes to /etc/salt/master

  ```yaml
  gitfs_remotes:
    - git://github.com/trexglobal/monit-formula
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
