require 'spec_helper'


describe "Pinguin::Request new" do 
  it "requires url and method" do 
    expect { Pinguin::Request.new() }.to raise_error "Url and methods are required for request"
  end

  it "sets url, method and params" do 
    request = Pinguin::Request.new(:url => "http://localhost:3000", :params => {:foo => "bar"}, :method => 'post') 
    request.url.should eq("http://localhost:3000")
    request.params.should eq({:foo => "bar"})
    request.method.should eq("post")
  end

end
