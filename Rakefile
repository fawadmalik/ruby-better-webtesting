# Rakefile
require 'rake/testtask'

Rake::TestTask.new do |webTask|
  webTask.libs << 'lib'
  webTask.test_files = FileList['lib/tests/*.rb']
  webTask.verbose = true
end