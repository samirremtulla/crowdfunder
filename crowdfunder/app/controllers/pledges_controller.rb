class PledgesController < ApplicationController
  
  before_filter :require_login

  def index
    @pledges = Pledge.all
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def create    
    @project = Project.find(params[:project_id])
    # @pledge = Pledge.new(
    #   :amount => params[:pledge][:amount],
    #   :user_id => current_user.id,
    #   :project_id => params[:project_id]
    #   )

    @pledge = @project.pledges.build params[:pledge]
    @pledge.user_id = current_user.id
    
    if @pledge.save!
      UserMailer.new_pledge(@pledge).deliver
      redirect_to project_path(@project), notice: "Thanks for pledging!"
    else
      render 'projects/show', notice: "Error"
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
