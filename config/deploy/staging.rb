# frozen_string_literal: true
set :stage, :staging

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w(tat-sbb-uat@stg.enrian.com)
role :web, %w(tat-sbb-uat@stg.enrian.com)
role :db,  %w(tat-sbb-uat@stg.enrian.com)

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server 'stg.enrian.com', user: 'tat-sbb-uat', roles: %w(web app db)

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'stg.enrian.com',
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

# fetch(:default_env).merge!(rails_env: :staging)
#
set :stage, :staging
set :rails_env, 'staging'
set :default_env, { 'RAILS_ENV' => 'staging', 'ROR_ASSET_HOST' => 'http://tat-sbb-uat.stg.enrian.com/' }
set :branch, 'master'
set :user, "tat-sbb-uat"
set :domain, 'tat-sbb-uat.stg.enrian.com'
set :deploy_to, "/home/#{fetch(:user)}/web"
set :passenger_restart_with_sudo, false

server fetch(:machine), user: fetch(:user), roles: %w(web app db)
