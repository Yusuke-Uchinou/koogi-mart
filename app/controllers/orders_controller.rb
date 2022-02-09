class OrdersController < ApplicationController

  def index
    @creators = Creator.all.order('created_at DESC')
    @orders = Order.all
    if user_signed_in?
      @current_creator = Creator.find_by(user: current_user.id)
    end
  end

  def new
    @creator = Creator.find_by(user: current_user.id)
    @order = Order.new
  end

  def create
    @creator = Creator.find_by(user: current_user.id)
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render new_order_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @creator = Creator.find(@order.creator_id)
    @room = Room.new
    @order_rooms = Room.find_by(creator_id: @creator.id, user_id: current_user.id)
  end

  def edit
    @creator = Creator.find_by(user: current_user.id)
    @order = Order.find(params[:id])
  end

  def update
    @creator = Creator.find_by(user: current_user.id)
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to root_path
    else
      render new_order_path
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:order_name, :order_text, :order_price_min, :order_price_max, :genre_id, :day_min, :day_max, :main_order_image, {order_images: []}).merge(creator_id: @creator.id)
  end
    
end
