require_relative 'robot'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
  end

  def all
    raw_robots.map do |data|
      Robot.new(data)
    end
  end

  def create(robot)
    database.execute("INSERT INTO robots
      (name, city, state, birthday, hire_day, department)
      VALUES
      ('#{robot[:name]}','#{robot[:city]}','#{robot[:state]}','#{robot[:birthday]}','#{robot[:hire_day]}','#{robot[:department]}');"
    )
  end

  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id = ?", id).first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.execute("UPDATE robots SET name= ?, city= ?, state= ?, birthday= ?, hire_day= ?, department= ?", robot[:name], robot[:city], robot[:state], robot[:birthday], robot[:hire_day], robot[:department])
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE ? == id", id)
  end

  def destroy_all
    database.execute("DELETE FROM robots")
  end
end
