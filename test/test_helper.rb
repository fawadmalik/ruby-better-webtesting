require 'minitest/autorun'
require 'minitest/reporters'

html_reporter = Minitest::Reporters::HtmlReporter.new
Minitest::Reporters.use! [html_reporter]