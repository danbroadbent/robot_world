require 'yaml/store'
require 'securerandom'
require_relative 'robot'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def all
    raw_robots.map do |data|
      Robot.new(data)
    end
  end

  def create(robot)
    database.transaction do
      database['robots'] ||= []
      database['robots'] << { "id" => SecureRandom.uuid, "name" => robot[:name], "avatar" => robot[:avatar], "city" => robot[:city], "state" => robot[:state], "department" => robot[:department], "birthday" => robot[:birthday], "hire_day" => robot[:hire_day]}
    end
  end

  def raw_robot(id)
    raw_robots.find do |robot| robot['id'] == id
    end
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot_data)
    database.transaction do
      robot = database['robots'].find { |robot| robot['id'] == id }
      robot['name'] = robot_data[:name]
    end
  end

  def destroy(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot['id'] == id }
    end
  end
end
