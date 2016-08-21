require_relative '../test_helper'

class DashboardStatsTest < Minitest::Test
  include TestHelpers

  def create_robot
    robot_manager.create({
      :name => "dave",
      :birthday => "01-01-2000"
      })
    robot = robot_manager.find(current_robot_id)
  end

  def current_robot_id
    robot_manager.all.last.id
  end

  def robots
    robot_manager.all
  end

  def test_calculates_avg_robot_age
    2.times { create_robot }
    RobotStats.new(robots)
    assert_equal 10, robots.average_robot_age
  end

  def test_calculates_robots_hired_per_year
    # total number of robots / total number of hiring years
  end

  def test_calulates_robots_per_location
    # total number of robots / total number of locations
  end
end
