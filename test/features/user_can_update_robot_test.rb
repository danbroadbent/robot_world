require_relative '../test_helper'

class TestUpdatesRobots < FeatureTest
  def test_updates_robot
    robot_manager.create({
        name: 'Joey',
        department: 'pizzeria'
      })
    visit '/robots'
    click_link('Joey')
    click_link('Edit this Robot')
    fill_in('robot[name]', :with => 'Ken')
    fill_in('robot[department]', :with => 'sewage')
    click_on('submit')
    assert page.has_content?('sewage')
  end
end
