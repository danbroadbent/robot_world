class Robot
  attr_reader :id,
              :name,
              :avatar,
              :city,
              :state,
              :birthday,
              :hire_day,
              :department

  def initialize(data)
    @id         = data['id']
    @name       = data['name']
    @avatar     = data['name']
    @city       = data['city']
    @state      = data['state']
    @birthday   = data['birthday']
    @hire_day   = data['hire_day']
    @department = data['department']
  end
end
