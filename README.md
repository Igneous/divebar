## Divebar

A ruby framework for building "status bar" applications. Currently is way-way-way alpha stage. Designed to make gathering data from different sources at different polling intervals (and dumping it out how and where you want) slightly less arduous.

### Current "Features":

* "Multithreaded" plugin polling
* Internal key:value store for plugin data storage
* Support for custom pluggable view drivers to render said data
   * Divebar::Driver::View::Erb (uses erb templates for dynamically rendering plugin data to a string)
* Support for custom pluggable output drivers to display rendered views
   * Divebar::Driver::Output::Stdout (for printing text to a pipe; should work for things like lemonbar)
   * Divebar::Driver::Output::XSetRoot (for vanilla dwm; uses a ruby C extension to call Xlib's `XStoreName()` to set the name of the root window)

### Installation instructions

```bash
gem install divebar
```

### Usage Example (see bin directory)


```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

require 'divebar'
require 'divebar/plugins/clock'
require 'divebar/plugins/loadavg'
require 'divebar/drivers/view/erb'
require 'divebar/drivers/output/xsetroot'

divebar = Divebar::Instance.new

divebar.config.update_interval  1

divebar.config.plugins.register Divebar::Plugin::Clock
divebar.config.plugins.register Divebar::Plugin::Loadavg

divebar.config.views.driver     Divebar::Driver::View::Erb
divebar.config.views.register   'base' # see views/base.erb
divebar.config.views.default    'base'

divebar.config.output_driver    Divebar::Driver::Output::XSetRoot

divebar.start
```
