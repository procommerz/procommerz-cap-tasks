module ProcommerzCapTasks
  class InstallGenerator < Rails::Generators::Base
    desc "Creates capistrano configuration files (Capfile, deploy.rb etc)"

    source_root File.expand_path("../templates", __FILE__)

    def add_capfile
      copy_file "Capfile", "Capfile"
    end

    def add_deploy_rb
      copy_file "deploy.rb", "config/deploy.rb"
    end

    def add_deploy_folder
      FileUtils.mkdir_p "config/deploy"

      copy_file "staging.rb", "config/deploy/staging.rb"
      copy_file "production.rb", "config/deploy/production.rb"
    end
  end
end