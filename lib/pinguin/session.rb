module Pinguin
  class Session

    attr_reader :settings, :cookie, :result
    def initialize(options={})
      @settings = options[:settings] || Pinguin::Settings.new(options.delete(:conf))
    end

    def urls
      settings.urls
    end

    def require_credential?
      !settings.credential.blank?
    end

    def build_arguments
      cmd_args = urls
      cmd_opts = {}
      if require_credential?
        cmd_opts['--url'] = credential.url
        cmd_opts['--username'] = credential.username
        cmd_opts['--password'] = credential.password
        cmd_opts['--usernameField'] = credential.username_field
        cmd_opts['--passwordField'] = credential.password_field
        cmd_opts['--loginForm'] = credential.loginForm
      end

      return [cmd_args, cmd_opts]
    end

    def build_cmd(cmd_args, cmd_opts={})
      cmd = ['casperjs', '--ignore-ssl-errors=yes', 'js/analyze.js']
      cmd_args.each { |arg| cmd << arg }
      cmd_opts.each_pair { |key, value| cmd << "#{key}=#{value}" }
      cmd.join(" ")
    end

    def analyze!
      cmd = build_cmd(*build_arguments)
      begin
        require 'open3'
        std_in, std_out, std_error = Open3.popen3(cmd)
      @reporter = Pinguin::Reporter.new(JSON.parse(std_out.readline), :format => settings.format || "json", :info => settings.info || 'bare')
      @reporter
      rescue Exception => e
        puts "error when trying to analyze! #{e.message}, #{e.class}, #{e.backtrace.join("\n")}"
      end
    end

    def credential
      settings.credential
    end

  end
end