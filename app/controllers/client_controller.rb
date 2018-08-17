
class ClientController < ApplicationController

  get '/signup' do
   if !logged_in?
     erb :'/clients/new_client' # if they are not logged in have them sign up
   else
     redirect "show_client" # if they are logged in take them to the user home page
   end
end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
        client = Client.create(username: params[:username], email: params[:email], password: params[:password])
        session[:client_id] = client.id
        client.save
        redirect "/show_client" # if sign up successful take them to the show page for all proejcts
      else
        redirect "/signup" # if sign up not successful take them back to sign up
    end
  end

end
