require 'spec_helper'

describe "It should work!" do 
  before do 
    settings = Pinguin::Settings.new(:urls => ['http://localhost:8070'], :format => 'json', :info => 'bare') 
    @session = Pinguin::Session.new(:settings => settings)
  end

  it "returns load time in json format" do 
    reporter = @session.analyze!
    reporter.report.each do |row| 
      row['url'].should eq('http://localhost:8070')
      (row['loadTime'].to_i > 0 ).should be_true
      # row['status'].should eq('success')
      row.keys.should eq(Pinguin::Info::BARE.map{ |b| b.to_s } )
    end
  end
  
end
