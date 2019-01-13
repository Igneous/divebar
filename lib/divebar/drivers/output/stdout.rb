# frozen_string_literal: true

module Divebar
  module Driver
    class Output
      class Stdout
        def draw(str)
          puts str
        end
      end
    end
  end
end
