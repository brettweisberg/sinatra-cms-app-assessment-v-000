
class ClientController < ApplicationController

  get '/signup' do
   if !logged_in?
     erb :'/clients/new_client' # if they are not logged in have them sign up
   else
     redirect "/clients/:id" # if they are logged in take them to the user home page
   end
end

  post '/signup' do
  #  binding.pry
    if !params[:name].empty? && !params[:email].empty? && !params[:password].empty?
        client = Client.create(name: params[:name], email: params[:email], password: params[:password])
        session[:client_id] = client.id
        client.save

        redirect "/clients/:id" # if sign up successful take them to the show page for all proejcts
      else
        redirect "/signup" # if sign up not successful take them back to sign up
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/login' #if not loggged in go to login
    else
      redirect "/clients/:id" #if logged in go to show page
    end
  end

  post '/login' do #recieve login info
    @client = Client.find_by(name: params[:name])
    if @client && @client.authenticate(params[:password])
    session[:client_id] = @client.id
    redirect "/clients/:id"
    else
        erb :'/login'
    end
  end

  get '/logout' do
    session.clear
    redirect "/login"
  end

  get '/clients/:id' do #show page
    #binding.pry
    if logged_in?
      @client = Client.find(session[:client_id])
      @client_projects = @client.projects.all
      erb :'/clients/show_client'
    else
      erb :'/login'
    end
  end

  get '/clients/:id/edit' do
    if logged_in?
      @client = Client.find_by(name: params[:name])
      erb :'/clients/edit_client'
    else
      erb :'/login'
    end
  end

  post '/clients/:id' do
    if logged_in?
      @client = Client.find_by(name: params[:name])
      @client = Client.update(name: params[:name], email: params[:email], password: params[:password])
      @client.save
      redirect  "/clients/#{@client.id}"
    else
      erb :'/login'
    end
  end
end
