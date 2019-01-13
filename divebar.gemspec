require File.expand_path('../lib/divebar/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'divebar'
  s.version     = Divebar::VERSION
  s.date        = '2019-01-13'
  s.summary     = "divebar"
  s.description = "A framework for building statusbars."
  s.authors     = ["Bucky Wolfe"]
  s.email       = 'pmigneous@gmail.com'
  s.files       = Dir["lib/**/*", 'views/*']
  s.homepage    = 'http://github.com/igneous/divebar'
  s.license     = 'MIT'

  s.bindir       = 'bin'
  s.require_path = 'lib'
  s.executables  = [ 'divebar-example-stdout', 'divebar-example-xsetroot' ]

  s.add_runtime_dependency 'xstorename', '~> 0.1.0', '>= 0.1.0' if RUBY_PLATFORM.match?(/linux/)
end
