server 'example.com:22', user: 'bitnami', roles: %w{app web db}, primary: true

set :ssh_options, {
    user: 'root',
    keys: [File.join(ENV["HOME"], ".ssh", "id_rsa")],
    forward_agent: false,
    auth_methods: %w(publickey)
}

set :rails_env, "staging"

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
