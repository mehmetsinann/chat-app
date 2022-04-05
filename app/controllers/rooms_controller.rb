class RoomsController < ApplicationController
  def index
    @room = Room.new
    @current_user = current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    redirect_to signin_path unless @current_user
  end

  def create
    @room = Room.create(params.require(:room).permit(:name))
    redirect_to rooms_path
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    redirect_to signin_path unless @current_user
  end
end