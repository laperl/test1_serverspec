require 'spec_helper'

describe default_gateway do
      its(:ipaddress) { should eq '172.16.3.1' }
        its(:interface) { should eq 'eth0'          }
end
