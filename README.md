# Gql-example

## Overview

TODO: Project description.

### Features
#### Feature A
TODO: Describe feature.

#### Feature B
TODO: Describe feature.

### Links
* [Production](TODO)
* [QA](TODO)
* [Issue Tracking](TODO)
* [Continuous Integration](TODO)

### Table of Contents

* [Overview](#overview)
* [Getting Started](#getting-started)
* [Configuration](#configuration)
* [Specs](#specs)
* [Rake Tasks](#rake-tasks)
* [Logging](#logging)
* [Deploying](#deploying)
* [Dev Notes](#dev-notes)

## Getting Started

The following pre-requisites are needed to build this project:
* Ruby 2.7.3

After cloning this repository, the project can be setup by running the `./bin/setup` script. This script will install dependencies and perform any other required setup tasks.

Once setup is complete, you can start a local development server by running the `./bin/server` script. Additionally, you can start a development console using the `./bin/console` script. The console uses the [racksh](https://github.com/sickill/racksh) gem which exposes a `$rack` variable that can be used to make simulated HTTP requests.

## Configuration
Environment variables are used for project configuration. For local development, the `.env` file is used. A sample file is shown below.

```
PORT=9292
RACK_ENV=development
SESSION_SECRET=secret
```

Here is a table containing all available environment variable configuration options and their descriptions.

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Required?</th>
            <th>Default Value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>DATABASE_URL</td>
            <td>Yes</td>
            <td>
              `sqlite://db/test.db` (for the test environment <em>only</em>)
            </td>
            <td>
              Connection URL to the database. The format varies according
              database adapter. Refer to the
              <a href="https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html">
              Sequel gem documentation</a> for more information. Some examples:
              <dl>
                <dt>Sqlite3</dt>
                <dd>`sqlite://db/development.db`</dd>
                <dt>PostgreSQL</dt>
                <dd>`postgresql://localhost/myapp_development?pool=5`</dd>
              </dl>
            </td>
        </tr>
        <tr>
            <td>MAX_THREADS</td>
            <td>No</td>
            <td>5</td>
            <td>The maximum number of threads that a Puma worker process should use</td>
        </tr>
        <tr>
            <td>PORT</td>
            <td>No</td>
            <td>9292</td>
            <td>Web server port</td>
        </tr>
        <tr>
            <td>RACK_ENV</td>
            <td>No</td>
            <td>production</td>
            <td>Web server environment (i.e. development, test, production, etc.)</td>
        </tr>
        <tr>
            <td>SESSION_SECRET</td>
            <td>Yes</td>
            <td>None</td>
            <td>Key used for signing and/or encrypting cookies set by the application to maintain session state</td>
        </tr>
        <tr>
            <td>WEB_CONCURRENCY</td>
            <td>No</td>
            <td>1</td>
            <td>The number of Puma worker processes</td>
        </tr>
    </tbody>
</table>

## Development
This project has the following default behavior:

* helpers scripts for common project actions; refer to the `bin` folder
* uses [Puma](https://github.com/puma/puma) as the default web server
* environment variable support via the [dotenv](http://rubygems.org/gems/dotenv) gem
* Procfile for [foreman](https://github.com/ddollar/foreman) support
* code reloading via the [rerun](https://github.com/alexch/rerun) gem is enabled for the development environment
* [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug") is installed for debugging

## Specs
This project uses [RSpec](https://rspec.info/) for testing. Specs can be ran using the rake task `rake spec`.

## Rake Tasks
To see a list of available tasks run the `rake -T` command.

## Logging
TODO: Describe how logging is setup (i.e. files, STDOUT, services like Papertrail, DataDog, etc.).

## Deploying
TODO: Describe how to deploy the project (QA, production, CI setup, etc.). Don't forget to describe how project environment variables are set for the various deployment targets.

## Dev Notes

## License
Copyright (c) 2022 Bob Nadler
