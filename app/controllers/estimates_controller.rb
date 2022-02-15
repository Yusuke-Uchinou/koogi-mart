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
    @estimate = Estimate.find(params[:id])
  end

  def edit
    @room = Room.find(params[:room_id])
    @order = Order.find(params[:order_id])
    @user = @room.user
    @estimate = Estimate.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @order = Order.find(params[:order_id])
    @user = @room.user
    @estimate = Estimate.find(params[:id])
    if @estimate.save
      redirect_to order_room_estimate_path
    else
      render edit_order_room_estimate_path
    end
  end

  private
  def estimate_params
    params.require(:estimate).permit(:estimate_price, :estimate_text, :estimate_image).merge(user_id: @user.id, room_id: @room.id)
  end
end
