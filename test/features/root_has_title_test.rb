require_relative '../test_helper'

class GreetingPageTest < FeatureTest
  def test_title_displayed
    visit '/'
    within('ul') do
      assert page.has_content?('Robot World')
    end
  end
end
