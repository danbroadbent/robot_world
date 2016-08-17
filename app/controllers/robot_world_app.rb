require 'models/robot_manager'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_manager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  get '/robots/:id' do
    @robot = robot_manager.find(params[:id])
    erb :show
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  get '/robot/:id/edit' do
    @robot = robot_manager.find(params[:id])
    erb :edit
  end

  put '/robots/:id' do
    robot_manager.update(params[:id], params[:robot])
    redirect "/robots/#{params[:id]}"
  end

  delete '/robots/:id' do
    robot_manager.destroy(params[:id])
    redirect "/robots"
  end

  def robot_manager
      database = YAML::Store.new('db/robotmanager')
      @robot_manager ||= RobotManager.new(database)
    end
end
