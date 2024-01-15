# test/specs/checkboxes_test.rb
require_relative 'spec_helper'

class CheckboxesTest < BaseTest
  def test_toggle_checkboxes
    checkboxes_link = @driver.find_element(link_text: 'Checkboxes')
    checkboxes_link.click

    checkboxes = @driver.find_elements(css: 'input[type="checkbox"]')
    initial_states = checkboxes.map(&:selected?)

    checkboxes.each(&:click)

    final_states = checkboxes.map(&:selected?)

    refute_equal initial_states, final_states, 'Checkbox states did not toggle'
  end
end