require 'yaml/store'
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
      database['robots'] << { "name" => robot[:name], "avatar" => robot[:avatar], "city" => robot[:city], "state" => robot[:state], "department" => robot[:department], "birthday" => robot[:birthday], "hire_day" => robot[:hire_day]}
    end
  end
end
