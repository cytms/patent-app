default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work

set :application, "patent cart"
set :repository,  "git@github.com:cytms/patent-app.git"

set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "andy"  # The server's user for deploys
set :scm_passphrase, "0510"  # The deploy user's password

set :deploy_to, "/home/andy/web/patent-app"


role :web, "54.248.134.150"                          # Your HTTP server, Apache/etc
# role :app, "54.248.134.150"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
  task :start, :roles => :web do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :web do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :web do
    run "touch #{current_release}/tmp/restart.txt"
  end
end