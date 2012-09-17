module Pinguin
  class Result

    class Format

      def initialize(data, type)
        @data = data
        @type = type  
      end

      def plain
        r = []
        @data.each do |row|
          r << row["url"]
          r << " takes "
          r << row["loadingTime"]
          r << " msec to load.\n"
        end
        r.join("")
      end

      def to_s
        send(@type)
      end

    end
    attr_reader :format, :info, :data

    def initialize(data, options={})
      @data = data
      @format = Format.new(data, options[:format] || "plain")
      @info = options[:info] || "time-only"
    end

    def raw
      @data
    end

    def to_s
      @format.to_s
    end

  end
end