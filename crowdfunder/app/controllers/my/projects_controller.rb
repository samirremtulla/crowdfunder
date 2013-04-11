class My::ProjectsController < ApplicationController
  def index
    @my_projects = current_user.projects.all
  end

  def new
  
  end

  def edit
  
  end
end
