require 'rack'

class TestApp
  def call(env)
    body = "Test App"
    [200, {"Content-Type" => "text/plain", "Content-Length" => body.length.to_s}, [body]]
  end
end


if $0 == __FILE__
  Rack::Handler::WEBrick.run Rack::Lint.new(TestApp.new), :Port => 8070  
end

