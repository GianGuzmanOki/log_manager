# Log Manager

Los Manager is a gem which will help you organize and manage the logs file your application produce.

## Installation

You can add it to your Gemfile with:

```bash
$ gem install log_manager
```

or directly in your Gemfile

```ruby
gem 'log_manager'
```

Then run `bundle install`


Next, you need to run the generator:

```console
$ rails generate log_manager:install
```
At this point you have a new file in your config folder named `log_manager.yml` which has 3 configuration fields (rotation_frequency, saved_files, compress) in 3 different enviroments (development, test, production).

Here is for what are they for and the possible configurable options:

rotation_frequency = How frequently you want your logs to be rotated.
Available options are:
* daily  #by default
* weekly
* monthly

saved_files = How many files you want to keep in your server before they are deleted for new ones.

compress = Compress the log that is been rotated. GZip is by default until further development of the gem.


## Execution

Once you changed the config/log_manager.yml to work under your requirements you need to run the following command:
```console
$ rails generate log_manager:execute --environment production
```
Note: You have to replace 'production' with the name of the enviroment you want to use and is configured on config/log_manager.yml.

This will generate a new file on your Root path named the same as your Rails application, if the file generated is named different than your rails Application (like 'current' because of some deployment gems) please change it manually because currently we dont support other gems. 
Then you have to move this file into /etc/logrotate.d/and just wait until the log file rotate (this will require you to have super user privileges).

## MIT License
* Copyright (c) 2016 Giancarlo Guzman. See LICENSE.txt for details.