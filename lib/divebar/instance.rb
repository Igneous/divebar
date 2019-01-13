# frozen_string_literal: true

require 'ostruct'
require 'divebar/config'

module Divebar
  # The Main class for Divebar; instantiate this with a config and run .loop
  class Instance
    attr_accessor :config, :data

    def initialize
      @data   = OpenStruct.new
      @config = Divebar::Config.new(binding())
    end

    def start
      loop do
        sleep config.update_interval
        draw(render(config.views.default))
      end
    end

    def draw(arg)
      @config.output_driver.draw(arg)
    end

    def render(arg)
      @config.views.driver.render(arg)
    end

  end
end
