require 'spec_helper'

describe package('openssh-server'), :if => os[:family] == 'redhat' do
  it { should be_installed.with_version('6.6.1p1-33.el7_3.x86_64') }
end

describe service('sshd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

describe default_gateway do
      its(:ipaddress) { should eq '192.168.10.1' }
        its(:interface) { should eq 'br0'          }
end
