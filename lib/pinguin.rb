require 'active_support/all'

module Pinguin
  autoload :Session, 'pinguin/session'
  autoload :Settings, 'pinguin/settings'
  autoload :Cookie, 'pinguin/cookie'
  autoload :Result, 'pinguin/Result'
  autoload :Reporter, 'pinguin/reporter'
  autoload :Request, 'pinguin/request'
  autoload :CasperJs, 'pinguin/casper_js'

  class << self
    attr_accessor :config

    def run(requests)
      requests_json = jsonify_requests(requests)
      casperjs = Pinguin::CasperJs.new(requests_json)
      casperjs.run
    end
  end
end
