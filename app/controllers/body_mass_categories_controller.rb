class BodyMassCategoriesController < ApplicationController
 
  skip_before_action :authorized

  def index
  end

  def create
    @bmi = bmi(body_params[:height], body_params[:weight])
    @category = category(@bmi)
    send_category(body_mass_categories_path, "bmi calculated")
  end

  private 

  def send_category(path, message)
    respond_to do |format|
     format.html {redirect_to path, notice: message}
     format.js
    end
  end

  def bmi(height, weight)
    (weight.to_f / ((height.to_f/100) ** 2))
  end

  def category(bmi)
    (bmi > 0 && bmi <= 100) ? BodyMass.where("min <= ? and max >= ?", bmi, bmi).first.category : "You must insert valid values"
  end

  def body_params
    params.require(:body_mass).permit(:height, :weight)
  end

end
