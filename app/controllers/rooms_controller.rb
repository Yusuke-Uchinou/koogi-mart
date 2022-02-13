class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :order_find, only: [:index, :new, :create, :make_estimate]

  def index
    @creator = Creator.find(@order.creator_id)
    @room = Room.new
  end

  def new
  end

  def create
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
    @messages = @room.messages.includes(:user)
    @message = Message.new
  end

  private
  def room_params
    @creator = Creator.find(@order.creator_id)
    params.require(:room).permit(:order_id).merge(user_id: current_user.id, creator_id: @creator.id)
  end

  def order_find
    @order = Order.find(params[:order_id])
  end
end
