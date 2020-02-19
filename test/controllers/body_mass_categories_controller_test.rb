require 'test_helper'
require 'pry'
class BodyMassCategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  def test_should_calculate_bmi 
    load_seed
    post '/signin', params: { user: create_user } 
    bmi = { weight: 70 , height: 190 }
    post body_mass_categories_url, params: { body_mass: bmi }, xhr: true
    assert_response :success
  end

  private 
    def create_user
      user = attributes_for(:user)
      User.new(user).save
      return user
    end

end
