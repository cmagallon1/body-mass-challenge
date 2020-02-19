class BodyMassCategoriesController < ApplicationController
  def index
    @categoy
  end

  def create
    @height = body_mass_params[:height]
    @weight = body_mass_params[:weight]
    @bmi = (@weight.to_f / ((@height.to_f/100) ** 2))
    (@bmi > 0 and @bmi <= 100) ? @category = BodyMass.where("min <= ? and max >= ?", @bmi, @bmi).first.category : @category = "You must insert valid values"
    respond_to do |format|
      format.html {redirect_to body_mass_categories_path, notice: "bmi calculated"}
      format.js
    end
  end

  private 

  def body_mass_params
    params.require(:body_mass).permit(:height, :weight)
  end

end
