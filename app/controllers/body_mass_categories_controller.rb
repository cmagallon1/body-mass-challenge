class BodyMassCategoriesController < ApplicationController
  def index
  end

  def create
    @height = body_mass_params[:height]
    @weight = body_mass_params[:weight]
    bmi = (@weight.to_f / ((@height.to_f/100) ** 2))
    (bmi > 0 and bmi <= 100) ? @category = BodyMass.where("min <= ? and max >= ?", bmi, bmi).first.category : @category = "You must insert valid values"
    render 'index'
  end

  private 

  def body_mass_params
    params.require(:body_mass).permit(:height, :weight)
  end

end
