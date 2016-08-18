require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({
      "name" => "dave",
      "city" => "denver"
      })
    assert_equal "dave", robot.name
    assert_equal "denver", robot.city
  end
end
