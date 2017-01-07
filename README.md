# Turtology

Turtology lets you run LOGO in your browser.  It borrows heavily from [Seymour Papert's Javascript implementation](https://code.google.com/archive/p/papert/)

## Getting Started

### Vagrant

After you have cloned this repo and installed [Vagrant], you can run the following:

[Vagrant]: https://www.vagrantup.com/

    % vagrant up
    % vagrant ssh
    % cd /vagrant
    % ./bin/setup
    % rails s

### Native OSX

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script] or some Googling.

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

