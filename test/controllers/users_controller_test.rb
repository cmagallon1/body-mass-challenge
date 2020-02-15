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
    post users_url, params: { user: { name: Faker::Name.unique.name_with_middle, username: Faker::Name.unique.name, password: Faker::Lorem.characters(number: 10)}}
    Faker::UniqueGenerator.clear
    end
  end
  
  #Add test para login y logout

end
