#!/usr/bin/env ruby

require_relative '../lib/naming_test'
require_relative '../lib/string_colors'
require_relative '../lib/read_all'
require_relative '../lib/space_test'
require_relative '../lib/launch_linter'

puts 'Launching' + ' DragonLintAlpha...'.red
puts 'Please enter which Ruby file from bin/error/ directory you would like to scan.'
puts 'Enter "*" to scan all .rb files inside bin/error directory.'

lint = LaunchLinter.new
lint.run
