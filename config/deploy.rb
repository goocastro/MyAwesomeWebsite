set :application, "gustavocastro.com"
set :repository,  "git://github.com/goocastro/MyAwesomeWebsite.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "goo"
set :user_sudo, "false"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache


role :web, "gustavocastro.com"                          # Your HTTP server, Apache/etc
role :app, "gustavocastro.com"                          # This may be the same as your `Web` server
role :db,  "gustavocastro.com", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
