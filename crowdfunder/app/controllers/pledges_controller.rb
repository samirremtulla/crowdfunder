class PledgesController < ApplicationController
  def index
    @pledges = Pledge.all
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def create    
    @project = Project.find(params[:project_id])
    @pledge = Pledge.new(
      :amount => params[:pledge][:amount],
      :user_id => current_user.id,
      :project_id => params[:id]
      )

    if @pledge.save!
      redirect_to root_path, notice: "Thanks for pledging!"
    else
      render 'projects/show'
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
