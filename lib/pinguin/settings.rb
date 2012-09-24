require 'ostruct'

module Pinguin
  class Settings

    OPTIONS = [
      'credential', 
      'ignore-ssl-errors',
      'urls',
      'format',
      'info'
    ].freeze

    attr_reader :config

    OPTIONS.each do |option|
      define_method option.to_sym do 
        config[option]        
      end
    end

    def initialize(config)
      @config = ActiveSupport::HashWithIndifferentAccess.new(config)
    end

    def credential
      if a = config[:credential]
        @credential = OpenStruct.new
        a.each_pair do |key, value|
          @credential.send("#{key}=", value)
        end
      end
      @credential
    end

    def urls
      @config[:urls]
    end

    def ignore_ssl_errors?
      true
    end

  end
end