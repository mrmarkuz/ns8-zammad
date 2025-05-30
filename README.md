# ns8-zammad

[Zammad](https://zammad.org/) is an open source user support/ticketing solution.

## Install

Install via Software Center by adding my [repository](https://repo.mrmarkuz.com)

or via CLI:

    add-module ghcr.io/mrmarkuz/zammad:latest 1

## Configure

Setup the mandatory FQDN in the app settings.

## Rails console

Zammad provides a console to for example reset passwords.

To run the console:

    runagent -m zammad2 podman exec -ti zammad-railsserver /docker-entrypoint.sh rails c

- [Zammad console docs](https://docs.zammad.org/en/latest/admin/console.html#working-on-the-console)

## Uninstall

To uninstall the instance:

    remove-module --no-preserve zammad1

