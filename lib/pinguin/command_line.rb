require 'thor'
require_relative '../pinguin'


module Pinguin
  module CommandLine

    class Base < Thor

      desc "test_loading_time", "test page loading time"
      method_option :file, :type => 'string', :desc => 'Give a config file'

      def test_loading_time
        conf = options[:file]
        session = Pinguin::Session.new(:conf => YAML::load_file(conf))
        puts session.analyze!.report
      end

    end

    def self.run
      Base.start
    end
  end
end