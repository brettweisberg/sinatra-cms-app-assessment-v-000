require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do #loads the homepage
    erb :'index'
end


  helpers do
    def current_user
      Client.find_by_id(session[:client_id])
    end

    def logged_in?
      !!session[:client_id]
    end


  end
end
