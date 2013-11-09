set :application, 'movie'
set :repo_url, 'https://git@bitbucket.org/kmasaharu/movie_server.git'

set :user, "hori"
set :use_sudo, false

set :deploy_to, "/var/www/#{fetch(:application)}"
set :bundle_flags, "--quiet"
set :deploy_via, :remote_cache
set :pty, true
set :forward_agent, true
set :branch, 'master'

role :web, "49.212.211.195"                          # Your HTTP server, Apache/etc
role :app, "49.212.211.195"                          # This may be the same as your `Web` server
role :db,  "49.212.211.195", :primary => true # This is where Rails migrations will run
role :db,  "49.212.211.195"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', release_path.join('tmp') # <= これを追加する
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
         execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
