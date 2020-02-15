class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :index, :signin, :menu] 

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(sign_up_params)
    
    if @user.save
      render 'index'
     else 
      render 'new'
    end
  end

  def signin 
    @user = User.find_by username: user_params[:username]
    if @user and @user.authenticate(user_params[:password])
      session[:current_user_id] = @user.id
      redirect_to body_mass_categories_path 
    else
      redirect_to '/signin'
    end
  end
  
  def logout
    destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def sign_up_params
    params.require(:user).permit(:name, :username, :password)
  end
end
