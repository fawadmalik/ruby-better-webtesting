# Rakefile

require 'rake/testtask'

task default: [:testAll]

Rake::TestTask.new(:testAll) do |webtesttask|
  webtesttask.libs << 'test'
  webtesttask.pattern = 'test/specs/**/*_test.rb'
  webtesttask.verbose = true
  webtesttask.warning = true
end