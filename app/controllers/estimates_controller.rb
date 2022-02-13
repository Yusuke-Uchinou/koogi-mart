class EstimatesController < ApplicationController
  def new
    @estimate = Estimate.new
    @room = Room.find(params[:room_id])
    @order = Order.find(params[:order_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @order = Order.find(params[:order_id])
    @user = @room.user
    @estimate = Estimate.new(estimate_params)
    if @estimate.save
      redirect_to root_path
    else
      render new_order_room_estimate_path
    end
  end

  def show
    @estimate = Estimate.find(params[:room_id])
  end

  private
  def estimate_params
    params.require(:estimate).permit(:estimate_price, :estimate_text, :estimate_image).merge(user_id: @user.id, room_id: @room.id)
  end
end
