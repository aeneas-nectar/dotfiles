oclif-hello-world
=================

oclif example Hello World CLI

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![Version](https://img.shields.io/npm/v/oclif-hello-world.svg)](https://npmjs.org/package/oclif-hello-world)
[![CircleCI](https://circleci.com/gh/oclif/hello-world/tree/main.svg?style=shield)](https://circleci.com/gh/oclif/hello-world/tree/main)
[![Downloads/week](https://img.shields.io/npm/dw/oclif-hello-world.svg)](https://npmjs.org/package/oclif-hello-world)
[![License](https://img.shields.io/npm/l/oclif-hello-world.svg)](https://github.com/oclif/hello-world/blob/main/package.json)

<!-- toc -->
* [Usage](#usage)
* [Commands](#commands)
<!-- tocstop -->
# Usage
<!-- usage -->
```sh-session
$ npm install -g dot-cli
$ dot-cli COMMAND
running command...
$ dot-cli (--version)
dot-cli/0.0.0 darwin-arm64 node-v16.13.2
$ dot-cli --help [COMMAND]
USAGE
  $ dot-cli COMMAND
...
```
<!-- usagestop -->
# Commands
<!-- commands -->
* [`dot-cli hello PERSON`](#dot-cli-hello-person)
* [`dot-cli hello world`](#dot-cli-hello-world)
* [`dot-cli help [COMMAND]`](#dot-cli-help-command)
* [`dot-cli plugins`](#dot-cli-plugins)
* [`dot-cli plugins:inspect PLUGIN...`](#dot-cli-pluginsinspect-plugin)
* [`dot-cli plugins:install PLUGIN...`](#dot-cli-pluginsinstall-plugin)
* [`dot-cli plugins:link PLUGIN`](#dot-cli-pluginslink-plugin)
* [`dot-cli plugins:uninstall PLUGIN...`](#dot-cli-pluginsuninstall-plugin)
* [`dot-cli plugins update`](#dot-cli-plugins-update)

## `dot-cli hello PERSON`

Say hello

```
USAGE
  $ dot-cli hello [PERSON] -f <value>

ARGUMENTS
  PERSON  Person to say hello to

FLAGS
  -f, --from=<value>  (required) Whom is saying hello

DESCRIPTION
  Say hello

EXAMPLES
  $ oex hello friend --from oclif
  hello friend from oclif! (./src/commands/hello/index.ts)
```

_See code: [dist/commands/hello/index.ts](https://github.com/awalkerca/hello-world/blob/v0.0.0/dist/commands/hello/index.ts)_

## `dot-cli hello world`

Say hello world

```
USAGE
  $ dot-cli hello world

DESCRIPTION
  Say hello world

EXAMPLES
  $ oex hello world
  hello world! (./src/commands/hello/world.ts)
```

## `dot-cli help [COMMAND]`

Display help for dot-cli.

```
USAGE
  $ dot-cli help [COMMAND] [-n]

ARGUMENTS
  COMMAND  Command to show help for.

FLAGS
  -n, --nested-commands  Include all nested commands in the output.

DESCRIPTION
  Display help for dot-cli.
```

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v5.1.12/src/commands/help.ts)_

## `dot-cli plugins`

List installed plugins.

```
USAGE
  $ dot-cli plugins [--core]

FLAGS
  --core  Show core plugins.

DESCRIPTION
  List installed plugins.

EXAMPLES
  $ dot-cli plugins
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v2.0.11/src/commands/plugins/index.ts)_

## `dot-cli plugins:inspect PLUGIN...`

Displays installation properties of a plugin.

```
USAGE
  $ dot-cli plugins:inspect PLUGIN...

ARGUMENTS
  PLUGIN  [default: .] Plugin to inspect.

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Displays installation properties of a plugin.

EXAMPLES
  $ dot-cli plugins:inspect myplugin
```

## `dot-cli plugins:install PLUGIN...`

Installs a plugin into the CLI.

```
USAGE
  $ dot-cli plugins:install PLUGIN...

ARGUMENTS
  PLUGIN  Plugin to install.

FLAGS
  -f, --force    Run yarn install with force flag.
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Installs a plugin into the CLI.

  Can be installed from npm or a git url.

  Installation of a user-installed plugin will override a core plugin.

  e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command
  will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in
  the CLI without the need to patch and update the whole CLI.

ALIASES
  $ dot-cli plugins add

EXAMPLES
  $ dot-cli plugins:install myplugin 

  $ dot-cli plugins:install https://github.com/someuser/someplugin

  $ dot-cli plugins:install someuser/someplugin
```

## `dot-cli plugins:link PLUGIN`

Links a plugin into the CLI for development.

```
USAGE
  $ dot-cli plugins:link PLUGIN

ARGUMENTS
  PATH  [default: .] path to plugin

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Links a plugin into the CLI for development.

  Installation of a linked plugin will override a user-installed or core plugin.

  e.g. If you have a user-installed or core plugin that has a 'hello' command, installing a linked plugin with a 'hello'
  command will override the user-installed or core plugin implementation. This is useful for development work.

EXAMPLES
  $ dot-cli plugins:link myplugin
```

## `dot-cli plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ dot-cli plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ dot-cli plugins unlink
  $ dot-cli plugins remove
```

## `dot-cli plugins update`

Update installed plugins.

```
USAGE
  $ dot-cli plugins update [-h] [-v]

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Update installed plugins.
```
<!-- commandsstop -->
