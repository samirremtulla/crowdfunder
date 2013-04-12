class ProjectsController < ApplicationController
  def index
    # @projects = Project.all
    # @projects = Project.order('created_at DESC') #SQL command
    @projects = Project.latest.page params[:page] #using a scope found in the project model (scopes can only be done in the model)
  end

  def show
    @project = Project.find(params[:id]);
    @pledge = Pledge.new #@project.pledges.build
    get_amount
  end

  def get_amount
    @sum= 0
    @project.pledges.each do |number|
      @sum+=number.amount.to_int
    end
    return @sum
  end



end

