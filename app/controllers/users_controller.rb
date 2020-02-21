class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :index, :signin]

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(sign_up_params)
    @user.save ? render('index') : render('new')
  end

  def signin 
    @user = search_user
    @user&.authenticate(user_params[:password]) ? save_session(@user) : render('index')
  end
  
  def logout
    destroy
  end

 private

   def search_user
     User.where("username = ? or email = ?", user_params[:username], user_params[:username]).first
   end

   def save_session(user)
     session[:current_user_id] = user.id
     redirect_to body_mass_categories_path
   end

   def user_params
     params.require(:user).permit(:username, :password)
   end

   def sign_up_params
     params.require(:user).permit(:name, :username, :password, :email)
   end

end
