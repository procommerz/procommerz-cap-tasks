server 'example.com:22', user: 'bitnami', roles: %w{app web db}, primary: true

set :ssh_options, {
    user: 'root',
    keys: [File.join(ENV["HOME"], ".ssh", "id_rsa")],
    forward_agent: false,
    auth_methods: %w(publickey)
}

set :repo_url, "git@example.com:me/my_repo.git"
set :branch, "master"
set :scm, :git

set :local_path, "/home/rails/htdocs"

# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options
