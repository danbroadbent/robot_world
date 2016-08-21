require_relative '../test_helper'

class CreateRobotTest < FeatureTest
  def test_creates_a_robot
    visit '/'
    click_link('Create a Robot')
    fill_in('robot[name]', :with => 'Eduardo')
    fill_in('robot[department]', :with => 'management')
    fill_in('robot[city]', :with => 'phoenix')
    fill_in('robot[state]', :with => 'AZ')
    fill_in('robot[birthday]', :with => '09-09-1985')
    fill_in('robot[hire_day]', :with => '01-01-2001')
    click_on('submit')
    assert page.has_content?('Eduardo')
    click_link('Eduardo')
    assert page.has_content?('management')
    assert page.has_content?('01-01-2001')
  end
end
