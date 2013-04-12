class My::ProjectsController < ApplicationController
  before_filter :require_login


  def index
    @projects = current_user.projects.latest.page params[:page] 
  end

  def new
    @project = Project.new(params[:project])
  end

  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id

    if @project.save
      redirect_to projects_path notice: "Thank you for creating a project"
    else
      render action: :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to my_projects_path, notice: "Project Updated"
    else
      render action: :edit, error: "Error"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to my_projects_path, notice: "Project Deleted!"
  end



end

