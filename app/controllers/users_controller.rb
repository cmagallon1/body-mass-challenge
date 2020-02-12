class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :index, :signin, :menu] 

  def index
    @user = User.new
  end

  def new
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
      puts logged_in?
      redirect_to '/category'
    else
      redirect_to '/signin'
    end
  end
  
  def logout
    destroy
  end

  def menu
    @body_mass = BodyMass.new
  end

  def category
    @height = body_mass_params[:height]
    @weight = body_mass_params[:weight]
   values = body_mass_params
   bmi = (@weight.to_f / ((@height.to_f/100) ** 2))
   puts bmi
   BodyMass.all.each do |record|
     if record.min.nil?
       @category = "Category: #{record.category}"; break if bmi <= record.max
     elsif record.max.nil?
       @category = "Category: #{record.category}"; break if bmi >= record.min
     else 
       @category = "Category: #{record.category}"; break if bmi >= record.min and bmi <= record.max
     end
   end
   render 'menu'
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def body_mass_params
    params.require(:body_mass).permit(:height, :weight)
  end

  def sign_up_params
    params.require(:user).permit(:name, :username, :password)
  end
end
