require_relative '../test_helper'

class DashboardStatsTest < Minitest::Test
  include TestHelpers

  def test_calculates_avg_robot_age
    sum of all robot ages / total number of robots
    # robots = robot_manager.all
    # average_robot_age = robot[:birthday]
    # assert_equal 10, average_robot_age
  end

  def test_calculates_robots_hired_per_year
    total number of robots / total number of hiring years
  end

  def test_calulates_robots_per_location
    total number of robots / total number of locations
  end
end
