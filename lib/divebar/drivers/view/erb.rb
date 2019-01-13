# frozen_string_literal: true

require 'erb'
require 'divebar/version'

module Divebar
  module Driver
    class View
      class Erb
        def initialize(instance_bind)
          @instance = instance_bind
        end

        def register_view(filepath)
          ERB.new(File.read(find_file(filepath)))
        end

        def render(view)
          view.result(@instance).chomp
        end

        private def find_file(filepath)
          searchpath = [filepath,
                        "#{Dir.pwd}/views/#{filepath}",
                        "#{Dir.pwd}/views/#{filepath}.erb",
                        "#{File.dirname(__FILE__)}/views/#{filepath}",
                        "#{File.dirname(__FILE__)}/views/#{filepath}.erb"] +
                        Gem.path.map { |p| "#{p}/gems/divebar-#{Divebar::VERSION}/views/#{filepath}" } +
                        Gem.path.map { |p| "#{p}/gems/divebar-#{Divebar::VERSION}/views/#{filepath}.erb" }
          realpath = searchpath.find { |file| File.exist?(file) }
          raise IOError, "Could not find template file #{filepath} in searchpath #{searchpath}" if realpath.nil?

          realpath
        end
      end
    end
  end
end

