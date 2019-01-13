# frozen_string_literal: true

require 'divebar/pluginlist'
require 'divebar/viewlist'

module Divebar
  class Config
    attr_accessor :plugins, :views

    def initialize(instance_bind)
      @update_interval = 1
      @plugins         = Divebar::PluginList.new(instance_bind)
      @views           = Divebar::ViewList.new(instance_bind)
    end

    def update_interval(interval = nil)
      @update_interval = interval unless interval.nil?
      @update_interval
    end

    def output_driver(klass = nil, instance_bind = nil)
      @output_driver = klass.new unless klass.nil?
      @output_driver
    end
  end
end
