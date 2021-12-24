class RoomsController < ApplicationController

  def index
    @order = Order.find(params[:order_id])
    @creator = Creator.find(@order.creator_id)
    @room = Room.new
  end

  def new
  end

  def create
    @order = Order.find(params[:order_id])
    @room = Room.new(room_params)
    if @room.save
      redirect_to "/orders/#{params[:order_id]}/rooms/#{@room.id}"
    else
      render order_rooms_path(@order.id)
    end
  end

  def show
    @room = Room.find(params[:id])
    @order = Order.find(@room.order_id)
    @creator = Creator.find(@order.creator_id)
    @owner = User.find(@creator.user_id)
  end

  private
  def room_params
    params.require(:room).permit(:order_id).merge(user_id: current_user.id)
  end
end
