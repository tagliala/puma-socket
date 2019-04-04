#!/usr/bin/env puma

directory '/var/www/application/current'
rackup "/var/www/application/current/config.ru"
environment 'production'

tag ''

pidfile "/var/www/application/shared/tmp/pids/puma.pid"
state_path "/var/www/application/shared/tmp/pids/puma.state"
stdout_redirect '/var/www/application/shared/log/puma_access.log', '/var/www/application/shared/log/puma_error.log', true

threads 0,16

bind 'unix:///var/www/application/shared/tmp/sockets/puma.sock'

workers 4

prune_bundler

# on_restart do
#  puts 'Refreshing Gemfile'
#  ENV["BUNDLE_GEMFILE"] = ""
# end
