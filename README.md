[![Ruby](https://github.com/fawadmalik/ruby-better-webtesting/actions/workflows/main.yml/badge.svg)](https://github.com/fawadmalik/ruby-better-webtesting/actions/workflows/main.yml)

# ruby-better-webtesting

**1. Project Structure:**

Create the following directory structure:

```
web_testing_project
|-- Gemfile
|-- Rakefile
|-- test
|   |-- test_helper.rb
|   |-- specs
|       |-- spec_helper.rb
|       |-- checkboxes_test.rb
|       |-- disappearing_elements_test.rb
|       |-- hovers_link_test.rb
|-- .gitignore
```

**2. Gemfile:**

```ruby
# Gemfile
source 'https://rubygems.org'

gem 'selenium-webdriver'
gem 'minitest'
gem 'rake'
```

Run `bundle install` in the terminal to install the required gems.

**3. spec_helper.rb:**

```ruby
# spec_helper.rb
require 'selenium-webdriver'
require 'minitest/autorun'
require 'test/test_helper.rb'

class BaseTest < Minitest::Test
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to 'https://the-internet.herokuapp.com/'
  end

  def teardown
    @driver.quit
  end
end
```

**4. checkboxes_test.rb:**

```ruby
# lib/tests/checkboxes_test.rb
require_relative '../spec_helper'

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
```

**5. disappearing_elements_test.rb:**

```ruby
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
```

**6. hovers_link_test.rb:**

```ruby
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
```

**7. test_helper.rb**

```ruby
# test/test_helper.rb

require 'minitest/autorun'
require 'minitest/reporters'

html_reporter = Minitest::Reporters::HtmlReporter.new
Minitest::Reporters.use! [html_reporter]
```

**8. Rakefile:**

```ruby
# Rakefile

require 'rake/testtask'

task default: [:test]

Rake::TestTask.new do |webtesttask|
  webtesttask.libs << 'test'
  webtesttask.pattern = 'test/specs/**/*_test.rb'
  webtesttask.verbose = true
  webtesttask.warning = true
end
```

**8. Run the Tests:**

Execute `rake` in the terminal to run all tests.

This project includes tests for the specified scenarios and utilizes Rake for automation. The tests are structured to cover the requested functionality on the provided homepage.

Note: First you have to run this code from the project root directory
```bash
bundle install
```
