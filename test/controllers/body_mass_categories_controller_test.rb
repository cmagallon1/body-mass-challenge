require 'test_helper'

class BodyMassCategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  def test_should_calculate_bmi 

    a = User.new
    #a.build_profile(username: "cmagallon", password: "12345" )
    post '/signin', params: { user:  { username: "cmagallon", password: "12345" } }

    assert_redirected_to body_mass_categories_path

    #post body_mass_categories_url, params: { body_mass: { height: Faker::Number.number(digits: 10), weight: Faker::Number.decimal(l_digits:10, r_digits:2) } }, xhr: true
    #assert_redirected_to body_mass_categories_url
  end
end
