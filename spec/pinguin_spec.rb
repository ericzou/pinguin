require 'spec_helper'

describe "It should work!" do 

  it "returns load time in plain english" do 
    session = Pinguin::Session.new(:conf => YAML::load_file(File.expand_path('../fixtures/pinguin.yml', __FILE__)))
    session.analyze!
    session.result.to_s.should match(/[^\s]+ takes (\d+) msec to load/)  
  end
  
end
