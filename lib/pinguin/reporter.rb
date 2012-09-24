module Pinguin


  class Info

    ALL = [:url, :startedAt, :status, :loadTime]
    BARE = ALL

    def initialize(type)
      @type = type
      @available_options = Info.const_get("#{type.upcase}")
    end

    def process(data)
      data.reject{ |key, value| @available_options.include?(key) }
    end

  end

  class Formatter

    def initialize(type)
      @type = type
    end

    def process(data)
      send(@type, data)
    end

    def json(data)
      data
    end

  end

  class Reporter

    attr_reader :report

    def initialize(data, options={})
      @info = Pinguin::Info.new(options[:info])
      @formatter = Pinguin::Formatter.new(options[:format])
      @data = data
      @report = build_report()
    end

    private 

    def build_report()
      data = @info.process(@data)
      data = @formatter.process(data)
      data
    end
  end

end