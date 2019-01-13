#!/usr/bin/env ruby
# frozen_string_literal: true

require 'divebar/plugin'

module Divebar
  class Plugin
    class Loadavg < Divebar::Plugin
      def configure
        options[:update_interval] = 5
      end

      def tick
        File.read('/proc/loadavg').split
      end

      def plugin_name
        'loadavg'
      end
    end
  end
end
