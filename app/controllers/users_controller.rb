class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :user_rooms]
  before_action :header_ready, only: [:show, :user_rooms]
  
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to "/users/#{current_user.id}"
    else
      render :edit
    end
  end

  def user_rooms
    @rooms = Room.where(user_id: current_user.id)
    @estimates = Estimate.where(user_id: current_user.id)
    if @creators.exists?(user_id: current_user.id)
      @owner_rooms = Room.where(creator_id: @current_creator.id)
      @owner_estimates = Estimate.where(room_id: @owner_rooms.ids)
    end

  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def header_ready
    @creators = Creator.all
    @nickname = current_user.nickname
    @current_creator = Creator.find_by(user: current_user.id)
  end
end
