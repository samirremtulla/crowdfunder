class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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

