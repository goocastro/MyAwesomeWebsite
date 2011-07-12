default_run_options[:pty] = true 

set :application, "gustavocastro.com"
set :repository,  "git://github.com/goocastro/MyAwesomeWebsite.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "goo"
set :user_sudo, "true"
set :deploy_to, "/var/www/#{application}"
set :git_shallow_clone, 1
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

  task :finalize_update, :except => { :no_release => true } do
    run "chmod -R g+w #{latest_release}" if fetch(:group_writable, true)

    # mkdir -p is making sure that the directories are there for some SCM's that don't save empty folders
    run <<-CMD
      rm -rf #{latest_release}/log &&
      mkdir -p #{latest_release}/public &&
      mkdir -p #{latest_release}/tmp &&
      ln -s #{shared_path}/log #{latest_release}/log
    CMD

    if fetch(:normalize_asset_timestamps, true)
      stamp = Time.now.utc.strftime("%Y%m%d%H%M.%S")
      asset_paths = %w(images css).map { |p| "#{latest_release}/public/#{p}" }.join(" ")
      run "find #{asset_paths} -exec touch -t #{stamp} {} ';'; true", :env => { "TZ" => "UTC" }
    end
  end
end
