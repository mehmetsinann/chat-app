class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages
  end

  def index
    @users = User.all_except(current_user)
    unless current_user.is_admin
      redirect_to rooms_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html{redirect_to rooms_path}
      else
        format.html{render 'users/new', status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end