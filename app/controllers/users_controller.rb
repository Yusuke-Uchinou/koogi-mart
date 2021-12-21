class UsersController < ApplicationController
  def show
    @creator = Creator.all
    @nickname = current_user.nickname
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

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
