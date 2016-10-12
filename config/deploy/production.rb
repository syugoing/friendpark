server '52.37.235.201', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/id_rsa'
