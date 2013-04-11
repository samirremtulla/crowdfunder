class My::ProjectsController < ApplicationController
  def index
    @projects = current_user.projects.all
  end

  def new
  
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to root_path, notice: "Project Updated"
    else
      render action: :edit
    end

  end
end

