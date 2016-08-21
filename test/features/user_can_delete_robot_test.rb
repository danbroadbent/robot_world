require_relative '../test_helper'

class TestDeletesRobot < FeatureTest
  def test_deletes_robot
    robot_manager.create({
        name: 'Joe',
        department: 'plummer',
        city: 'co'
      })
    visit '/robots'
    click_on('Joe')
    assert page.has_content?('plummer')
    click_on('Delete this Robot')
    assert page.has_no_content?('plummer')
  end
end
