require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  def robot_manager
      database = YAML::Store.new('db/taskmanager')
      @robot_manager ||= RobotManager.new(database)
    end

end
