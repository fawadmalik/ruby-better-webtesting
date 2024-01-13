# Rakefile

require 'rake/testtask'

task default: [:test]

Rake::TestTask.new do |webtesttask|
  webtesttask.libs << 'test'
  webtesttask.pattern = 'test/specs/**/*_test.rb'
  webtesttask.verbose = true
  webtesttask.warning = true
end