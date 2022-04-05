class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  before_action :update_last_seen_at, if: -> { logged_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 1.minutes.ago) }

  def current_user
    if session[:user_id]
      return @current_user  = User.find(session[:user_id])
    end
  end

  def update_last_seen_at
    if current_user
      current_user.update(last_seen_at: Time.current)
    end
  end

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
    redirect_to rooms_path, notice: 'Logged in successfully'
  end

  def logged_in?
    if current_user.nil?
      return false
    else
      return true
    end
  end

  def log_out
    @current_user = current_user
    session.delete(:user_id)
    @current_user = nil
    redirect_to rooms_path
  end

  def authorized
    redirect_to '/signin' unless logged_in?
  end
end