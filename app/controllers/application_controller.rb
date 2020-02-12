class ApplicationController < ActionController::Base
  
  before_action :authorized
  helper_method :logged_in?

  private 
  
  def current_user
    @_current_user =session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/signin' unless logged_in?
  end

  def destroy
    puts "hola"
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to '/signin'
  end
end
