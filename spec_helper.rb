# spec_helper.rb
require 'selenium-webdriver'
require 'minitest/autorun'

class BaseTest < Minitest::Test
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to 'https://the-internet.herokuapp.com/'
  end

  def teardown
    @driver.quit
  end
end