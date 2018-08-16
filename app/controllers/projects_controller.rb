
require "pry"
class ProjectsController < ApplicationController

  get '/projects/new' do # create a new project
    erb :'/projects/new_project'
  end

  post '/projects' do #create a new project
    #binding.pry

  end

end
