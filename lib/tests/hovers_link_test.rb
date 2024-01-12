# lib/tests/hovers_link_test.rb
require_relative '../spec_helper'

class HoversLinkTest < BaseTest
  def test_hover_text_not_empty
    hovers_link = @driver.find_element(link_text: 'Hovers')
    hovers_link.click

    figures = @driver.find_elements(css: '.figure')
    random_figure = figures.sample

    @driver.action.move_to(random_figure).perform

    hover_text = random_figure.find_element(css: '.figcaption').text

    refute_empty hover_text, 'Hover text is empty'
  end
end
