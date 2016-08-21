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

  def age
    bdate = Date.parse birthday
    now = Time.now.utc.to_date
    now.year - bdate.year
  end

  def hire_year
    hdate = Date.parse hire_day
    hdate.year
  end
end
