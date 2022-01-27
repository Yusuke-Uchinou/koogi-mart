class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to "/orders/#{params[:order_id]}/rooms/#{params[:room_id]}"
    else
      render root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
