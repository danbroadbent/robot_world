require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_creates_a_robot
    robot_manager.create({
      name: "dave",
      city: "denver"
      })
    robot = robot_manager.find(1)
    assert_equal "dave", robot.name
    assert_equal "denver", robot.city
  end

  def robot_manager
    database = YAML::Store.new("db/robot_manager_test")
    @robot_manager ||= RobotManager.new(database)
  end
end
