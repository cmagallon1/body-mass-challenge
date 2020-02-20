class BodyMassCategoriesController < ApplicationController
  def index
    @categoy
  end

  def create
    @height = body_mass_params[:height]
    @weight = body_mass_params[:weight]
    @bmi = bmi(@height, @weight)
    @category = get_category(@bmi)
    respond_to do |format|
      format.html {redirect_to body_mass_categories_path, notice: "bmi calculated"}
      format.js
    end
  end

  

  private 

    def bmi(height, weight)
      (@weight.to_f / ((@height.to_f/100) ** 2))
    end

    def get_category(bmi)
      (bmi > 0 && bmi <= 100) ? BodyMass.where("min <= ? and max >= ?", bmi, bmi).first.category : "You must insert valid values"
    end

    def body_mass_params
      params.require(:body_mass).permit(:height, :weight)
    end

end
