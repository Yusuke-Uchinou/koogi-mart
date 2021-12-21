class CreatorsController < ApplicationController
  def top
  end

  def index
  end

  def new
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params)
    if @creator.save
      redirect_to root_path
    else
      render new_creator_path
    end
  end

  def show
    @creator = Creator.find(params[:id])
  end


  private
  def creator_params
    params.require(:creator).permit(:creator_name, :creator_text).merge(user_id: current_user.id)
  end
end
