# ProcommerzCapTasks

TODO: Write a gem description


## Installation

Add this line to your application's Gemfile:

    gem 'procommerz_cap_tasks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install procommerz_cap_tasks

Then run gem's generator to install config files:

rails g procommerz_cap_tasks:install


## Usage

*Available Tasks:*

* deploy: (previously stack:deploy), updates remote server with latest branch code:
** git pull
** bundle install
** rake dump (for backup, just in case)
** rake db:migrate
** rake tmp:cache:clear (clears production cache)
** rake assets:precompile (only if enabled for environment, compile on _remote_ machine. note, that currently we compile assets locally and upload (rsync) them to remote)
** restart rails server (service unicorn restart)
* db:remote:pull: (previously stack:db:dump_from) overwrites locale database with remote [staging or production] database copy, including data and structure
* db:locale:push: (previously stack:db:dump_to) overwrites remote database with local [development] database copy, including data and structure
* server:restart: (previously stack:server:reload) restarts unicorn server
* assets:update: (previously stack:assets:update) updates app with the whole latest version from git but then just recompiles the assets (extremely helpful for production-related front-end testing and bugfixing)
** git pull
** rake assets:precompile
** rake tmp:cache:clear (clears production cache)

The following configuration options (per environment) should be available:

* compile assets upon deploy (boolean)
* local app path (see conventions below)
* (mysql credentials? if you don't want to use toy/dump for database sync, maybe use mysql directly?)


## Assumed Conventions

* Application is always located under the /home/rails path, which is always the root of app's git working copy (e.g. a path /home/rails/htdocs/public/index.html will usually be valid, although it would be nice to have total control on this option). In current non-gem tasks this is set in the config/deploy/production.rb 'set :local_path ...' directive
* Nginx + Unicorn are always used for server. To restart a Rails App one must call 'service unicorn restart' as root 
* toy/dump gem is always available in our apps to assist with database-related tasks
* Remote machine is powerful enough to perform a rake assets:precompile (so assets can be compiled remotely, which was previously a problem with amazon instances) 
* rsync is available on both systems for file sync (mainly used for database dump sync both ways between local and remote)


## Contributing

1. Fork it ( https://github.com/[my-github-username]/procommerz_cap_tasks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
