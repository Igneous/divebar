# frozen_string_literal: true

require 'XStoreName'

module Divebar
  module Driver
    class Output
      class XSetRoot
        def draw(str)
          XStoreName.set_xname(str)
        end
      end
    end
  end
end
