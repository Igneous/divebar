require 'divebar/configuration/bar'
require 'divebar/plugin_list'

module Divebar
  class Bar
    attr_reader :plugins

    def initialize(&b)
      @config  = Configuration::Bar.new
      @plugins = PluginList.new(self)
      instance_eval(&b) if block_given?
    end

    def configure
      yield @config
    end
  end
end
