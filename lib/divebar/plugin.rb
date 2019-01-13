# frozen_string_literal: true

module Divebar
  class Plugin
    attr_accessor :options

    def initialize(instance_bind, options = {})
      @options = options
      @options[:update_interval] = 1 unless options[:update_interval]
      @instance = instance_bind
    end

    def start
      Thread.new do
        loop do
          @instance.eval("@data")[plugin_name] = tick
          sleep options[:update_interval]
        end
      end
    end
  end
end
