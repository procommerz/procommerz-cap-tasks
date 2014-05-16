namespace :stack do
  task :uptime do
    on roles(:app) do
      uptime = capture(:uptime)
      puts "#{host.hostname} reports: #{uptime}"
    end
  end
end