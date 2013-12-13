class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def user_online
    if session[:current_user].blank? 
      redirect_to "/topics", notice: 'Please login!'
    end
  end
end
