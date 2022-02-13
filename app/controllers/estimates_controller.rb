class EstimatesController < ApplicationController
  def new
    @estimate = Estimate.new
    @room = Room.find(params[:room_id])
    @order = Order.find(params[:order_id])
    @user = @room.user
  end

  def create
    @estimate = Estimate.new(estimate_params)
  end

  private
  def estimate_params
    params.require(:estimate).permit(:estmate_price, :estimate_text, :estimate_image).merge(user_id: @user.id, room_id: @room.id)
  end
end
