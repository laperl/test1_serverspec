require 'serverspec'
require 'net/ssh'

set :backend, :ssh
# Jaume, mho demana per accedir
set :request_pty, true

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

# Jaume exemple
puts "\n## Running Tests on #{host} >>>"

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :host_key,    options[:host_key => "ssh-rsa"]
set :keys,        options[:keys => "/home/contint/test1_serverspec/inventario/llaves/maquinatest.dcip_epg_ost.cloud.key"]
set :ssh_options, options

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
