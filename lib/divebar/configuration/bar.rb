require 'divebar/configuration'

module Divebar
  class Configuration
    class Bar < Configuration
      KnownOptions = [:plugins, :outputdriver]

      # (see Configuration.default_config)
      def self.default_config
        {
          :plugins => ["CPU", "Memory"],
          :outputdriver => "STDOUT"
        }
      end
    end
  end
end
