require 'faker'
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def test_should_get_index
    get users_url
    assert_response :success
  end

  def test_should_create_user
    assert_difference("User.count") do 
      post users_url, params: { user: attributes_for(:user) }
      assert_response :success
    end
  end

  def test_user_should_sign_in_with_valid_data
    user = create_user
    post '/signin' , params: { user: user }
    assert_redirected_to body_mass_categories_path
  end

  def test_user_should_not_sign_in_with_invalid_data
    user = create_user
    user[:password] = Faker::Lorem.characters(number: 10)
    post '/signin' , params: { user: user }
    assert_redirected_to '/signin'  
  end

  def test_user_should_log_out
    delete '/logout'
    assert_not is_logged_in?
    assert_redirected_to '/signin' 
  end
  
  private
    def create_user 
      user = attributes_for(:user) 
      User.new(user).save
      return user
    end
  
end
