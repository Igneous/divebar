# frozen_string_literal: true

require 'divebar/plugin'

module Divebar
  class Plugin
    class Clock < Divebar::Plugin
      def tick
        Time.now.to_s
      end

      def plugin_name
        'clock'
      end
    end
  end
end
