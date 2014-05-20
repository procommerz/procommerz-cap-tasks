namespace :stack do

  desc "Report server uptime"
  task :uptime do
    on roles(:app) do
      uptime = capture(:uptime)
      puts "#{host.hostname} reports: #{uptime}"
    end
  end

  desc "Update remote server with latest branch code"
  task :deploy do
    on roles(:app) do
      within fetch(:deploy_to) do
        puts "\nUpdating from git repo..."
        execute :git, :pull

        puts "\nUpdating bundle..."
        execute :bundle, "install"

        puts "\nBacking up the database for easy rollback..."
        execute :rake, "dump"

        # puts "\nUpdating the database..."
        # execute :rake, "db:migrate"
        #
        # puts "\nClearing application cache..."
        # execute :rake, "tmp:cache:clear"
      end
    end
  end

  namespace :db do

    namespace :remote do

      desc "Overwrite local database with remote [staging or production] database copy, including data and structure"
      task :pull do

      end

    end

    namespace :local do

      desc "Overwrite remote database with local [development] database copy, including data and structure"
      task :push do

      end

    end

  end

  namespace :server do

    desc "Restart unicorn server"
    task :restart do

    end

  end

  namespace :assets do

    desc "Update app with the latest version from git and recompiles assets"
    task :update do

    end

  end



  # task :deploy_no_migrations do
  #   on roles(:app) do
  #     within fetch(:remote_path) do
  #       with rails_env: :staging do
  #         uptime = capture(:uptime)
  #         puts "#{host.hostname} reports: #{uptime}"
  #
  #         puts "\nUpdating from git repo..."
  #         execute :git, :pull
  #       end
  #     end
  #   end
  # end
  #
  # namespace :db do
  #   desc "Clone local database schema to remote server database"
  #   task :dump_to do
  #     puts "\nDumping db local => remote..."
  #
  #     puts %x{bundle exec rake dump}
  #
  #     remote_path = fetch(:remote_path)
  #
  #     puts "\nRsyncing dumps with remote host..."
  #
  #     on roles(:app) do |host|
  #       if host.port != 22
  #         ssh_argument = "--rsh='ssh -p#{host.port}'"
  #       else
  #         ssh_argument = "--rsh=ssh"
  #       end
  #
  #       puts %x{rsync #{ssh_argument} --recursive --times --compress --human-readable --progress --exclude .git* ./dump #{host.user}@#{host.hostname}:#{local_path}/}
  #
  #       puts "\nRestoring dump..."
  #
  #       within fetch(:remote_path) do
  #         with rails_env: :staging do
  #           execute :bundle, "exec", "rake dump:restore"
  #
  #           puts "\nClearing application cache..."
  #           execute :rake, "tmp:cache:clear"
  #         end
  #       end
  #     end
  #   end
  #
  #   desc "Clone database schema from remote server to local database"
  #   task :dump_from do
  #     puts "\nDumping db remote => local..."
  #
  #     remote_path = fetch(:remote_path)
  #
  #     puts "\nRsyncing dumps with remote host..."
  #
  #     on roles(:app) do |host|
  #       within fetch(:remote_path) do
  #         with rails_env: :production do
  #           execute :pwd
  #           execute :bundle, "exec", "rake dump"
  #         end
  #       end
  #
  #       if host.port != 22
  #         ssh_argument = "--rsh='ssh -p#{host.port}'"
  #       else
  #         ssh_argument = "--rsh=ssh"
  #       end
  #
  #       puts %x{rsync #{ssh_argument} --recursive --times --compress --human-readable --progress --exclude .git* #{host.user}@#{host.hostname}:#{remote_path}/dump ./}
  #
  #       puts "\nRestoring dump..."
  #
  #       puts %x{bundle exec rake dump:restore}
  #     end
  #   end
  # end
  #
  # namespace :assets do
  #   task :update do
  #     puts "\nPrecompiling assets..."
  #
  #     %x{bundle exec rake assets:precompile}
  #
  #     #puts "Uploading precompiled..."
  #     #upload! "public/assets", "./public", recursive: true # not needed with rsync
  #
  #     puts "\nRsyncing assets to remote host..."
  #
  #     remote_path = fetch(:remote_path)
  #
  #     on roles(:app) do |host|
  #       #puts "Cleaning remote assets..."
  #       #capture("rm -Rf ./public/assets") # not needed with rsync
  #
  #       if host.port != 22
  #         ssh_argument = "--rsh='ssh -p#{host.port}'"
  #       else
  #         ssh_argument = "--rsh=ssh"
  #       end
  #
  #       puts %x{rsync #{ssh_argument} --recursive --times --compress --human-readable --progress --delete-after --exclude .git* ./public/assets #{host.user}@#{host.hostname}:#{local_path}/public}
  #     end
  #
  #     #puts "Cleaning local precompiled assets..."
  #     #%x{bundle exec rake assets:clean}
  #     #%x{rm -Rf ./public/assets}
  #   end
  # end
  #
  # namespace :server do
  #   task :reload do
  #     on roles(:app) do
  #       within fetch(:remote_path) do
  #         with rails_env: :staging do
  #           puts "\nTelling Phusion Passenger to restart the stack..."
  #           execute :touch, "#{fetch(:remote_path)}/tmp/restart.txt"
  #         end
  #       end
  #     end
  #   end
  #
  #   task :restart do
  #     on roles(:app) do
  #       uptime = capture(:uptime)
  #       puts "#{host.hostname} reports: #{uptime}"
  #
  #       puts "\nRestarting nginx..."
  #
  #       #execute :sudo, '/home/bitnami/stack/ctlscript.sh', 'restart', 'nginx'
  #       capture "sudo /home/bitnami/stack/ctlscript.sh restart nginx"
  #     end
  #   end
  # end
  #
  # after "stack:deploy", "stack:assets:update"
  # after "stack:deploy", "stack:server:reload"
  # after "stack:deploy_no_migrations", "stack:server:reload"
  # after "stack:deploy_no_migrations", "stack:assets:update"
  # after "stack:assets:update", "stack:server:reload"



  # task :pull do
  #   on roles(:app) do
  #     within fetch(:remote_path) do
  #       with rails_env: :staging do
  #         puts "\nUpdating from git repo..."
  #         execute :git, :pull
  #       end
  #     end
  #   end
  # end
end