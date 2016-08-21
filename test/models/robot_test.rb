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

  def test_it_calculates_robot_age
    robot = Robot.new({
      "name" => "dave",
      "city" => "denver",
      "birthday" => "2000-01-01",
      "hire_day" => "2006-01-01"
      })
    assert_equal 16, robot.age
  end

  def test_it_calculates_robot_years_worked
    robot = Robot.new({
      "name" => "dave",
      "city" => "denver",
      "birthday" => "2000-01-01",
      "hire_day" => "2006-01-01"
      })
    assert_equal 10, robot.years_worked
  end
end
