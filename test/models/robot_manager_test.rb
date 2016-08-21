require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_manager.all.last.id
  end

  def create_robot
    robot_manager.create({
      :name => "dave",
      :birthday => "01-01-2000"
      })
    robot = robot_manager.find(current_robot_id)
  end

  def number_of_robots
    robot_manager.all.count
  end

  def test_creates_a_robot
    robot = create_robot
    assert_equal current_robot_id, robot.id
    assert_equal "dave", robot.name
  end

  def test_returns_all_robots
    2.times { create_robot }
    assert_equal 2, number_of_robots
  end

  def test_finds_a_robot_by_id
    robot = create_robot
    assert_instance_of Robot, robot
  end

  def test_deletes_robot
    create_robot
    assert_equal 1, number_of_robots
    robot_manager.destroy(current_robot_id)
    assert_equal 0, number_of_robots
  end

  def test_updates_robot
    robot = create_robot
    assert_equal "dave", robot.name
    robot_manager.update(current_robot_id, {:name => "chewbacca"})
    robot = robot_manager.find(current_robot_id)
    assert_equal "chewbacca", robot.name
  end



end
