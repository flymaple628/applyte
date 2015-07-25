# config valid only for current version of Capistrano
lock '3.4.0'

`ssh-add` # need this to make key-forwarding work

set :application, 'applyte'
set :repo_url, 'git@github.com:crsgypin/applyte.git'

set :deploy_to, '/home/deploy/applyte/'

set :keep_releases, 5

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/facebook.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end 

