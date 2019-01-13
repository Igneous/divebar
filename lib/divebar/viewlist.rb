# frozen_string_literal: true

module Divebar
  class ViewList 
    attr_reader :list

    def initialize(instance_bind)
      @list = {}
      @instance = instance_bind
    end

    def driver(klass = nil)
      @driver = klass.new(@instance) unless klass.nil?
      @driver
    end

    def default(viewname = nil)
      @default = viewname unless viewname.nil?
      list[@default]
    end

    def register(viewname)
      raise 'Set the view driver before registering views' unless @driver

      list[viewname] = @driver.register_view(viewname)
    end
  end
end
