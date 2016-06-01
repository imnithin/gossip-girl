# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'gossip-girl'
set :repo_url, 'git@github.com:imnithin/gossip-girl.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "~/#{fetch(:application)}/"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/mongoid.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

before "deploy:restart", "deploy:asset_precompile"
after "deploy:restart", "deploy:cleanup_assets"

namespace :deploy do

  desc 'assets precompile'
  task :asset_precompile do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: fetch(:stage) do
          execute :rake, "assets:precompile"
        end
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

end
