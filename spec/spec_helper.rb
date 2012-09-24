require 'rspec'
require 'rspec/matchers'
require 'yaml'

require_relative '../lib/pinguin'
require_relative 'fixtures/test_app'


# def startup_server
#   @@server_process = fork do 
#     Rack::Handler::WEBrick.run Rack::Lint.new(TestApp.new), :Port => 8070  
#   end
# end

# def stop_server
#   Process.kill "TERM", @@server_process
# end