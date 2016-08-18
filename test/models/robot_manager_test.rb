require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_creates_a_robot
    robot_manager.create({
      :name => "dave",
      :city => "denver"
      })
    robot = robot_manager.find("dave")
    assert_equal "dave", robot.name
    assert_equal "denver", robot.city
  end
end
