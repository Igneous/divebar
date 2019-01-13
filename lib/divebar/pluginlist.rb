# frozen_string_literal: true

module Divebar
  class PluginList
    attr_reader :list, :threads

    def initialize(instance_bind)
      @list = []
      @threads = []
      @instance = instance_bind
    end

    def register(plugin, **options)
      case plugin.class
      when String
        @list << get_class(plugin).new(@instance, options)
        @threads << @list.last.start
      when Class
        @list << plugin.new(@instance, options)
        @threads << @list.last.start
      else
        raise ArgumentError, 'Expected Class Name or Class.to_s for plugin'
      end
    end

    private def get_class(str)
      str.split('::').inject(Object) do |mod, class_name|
        mod.const_get(class_name)
      end
    end
  end
end
