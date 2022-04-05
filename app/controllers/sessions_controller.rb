class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def create
    @user = User.find_by(username: params[:user][:username])
    respond_to do |format|
      if @user && @user.authenticate(params[:user][:password])
        format.html{log_in(@user)}
      else
        format.html{render 'sessions/new', status: :unprocessable_entity}
      end
    end
  end

  def new

  end

  def destroy
    respond_to do |format|
      if logged_in?
        format.html{log_out}
      end
    end
  end

end