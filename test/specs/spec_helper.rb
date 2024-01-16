# test/specs/spec_helper.rb
require 'selenium-webdriver'
require 'minitest/autorun'
require_relative '../test_helper'

class BaseTest < Minitest::Test
  def setup
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    @driver = Selenium::WebDriver.for :chrome, options: options
    @driver.navigate.to 'https://the-internet.herokuapp.com/'
  end

  def teardown
    @driver.quit
  end
end