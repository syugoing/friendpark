server 'EC2のIPアドレス', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '鍵へのpath'
