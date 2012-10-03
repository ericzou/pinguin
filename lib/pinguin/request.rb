module Pinguin
  class Request

    attr_accessor :url, :method, :params
    
    def initialize(options={})
      @url = options[:url] 
      @method = options[:method]
      @params = options[:params]
      raise "Url and methods are required for request" unless @url && @method
    end

  end
end