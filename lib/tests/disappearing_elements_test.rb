# lib/tests/disappearing_elements_test.rb
require_relative '../spec_helper'

class DisappearingElementsTest < BaseTest
  def test_disappearing_elements
    disappearing_elements_link = @driver.find_element(link_text: 'Disappearing Elements')
    disappearing_elements_link.click

    initial_elements_count = @driver.find_elements(css: '.example li').count

    loop do
      @driver.navigate.refresh
      break if @driver.find_elements(css: '.example li').count != initial_elements_count
    end

    final_elements_count = @driver.find_elements(css: '.example li').count

    refute_equal initial_elements_count, final_elements_count, 'Element count did not change'
  end
end