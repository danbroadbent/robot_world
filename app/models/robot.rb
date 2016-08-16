class Robot
  attr_reader :name,
              :avatar,
              :city,
              :state,
              :birthday,
              :hire_day,
              :department

  def initialize(data)
    @name       = data['name']
    @avatar     = data['avatar']
    @city       = data['city']
    @state      = data['state']
    @birthday   = data['birthday']
    @hire_day   = data['hire_day']
    @department = data['department']
  end
end
