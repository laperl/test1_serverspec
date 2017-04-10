require 'spec_helper'

describe command('ls -la ~/.ssh/') do
      its(:stdout) { should contain('llave_advanced') }
end
