require 'test_helper'
require 'faker'
require 'pry'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_save_user
    user = User.new({ name: Faker::Name.unique.name_with_middle, username: Faker::Name.unique.name, password_digest: Faker::Lorem.characters(number:10) })
    assert user
    Faker::Name.unique.clear
  end

  def test_save_user_without_params
    user = User.new
    assert_not user.save, "Saved the user without params"
  end

  def test_save_user_with_under_limit_password
    user = User.new({ name: Faker::Name.unique.name_with_middle, username: Faker::Name.unique.name, password_digest: Faker::Lorem.characters(number:4) })
    assert_not user.save, "User saved with password under the limit"
    Faker::Name.unique.clear
  end

  def test_save_user_already_registered
    user = User.new({ name: Faker::Name.unique.name_with_middle, username: Faker::Name.unique.name, password_digest: Faker::Lorem.characters(number:10) })
    second_user = User.new({ name: Faker::Name.unique.name_with_middle, username: user[:username], password_digest: Faker::Lorem.characters(number:10) })
    assert user  
    second_user = User.new({ name: Faker::Name.unique.name_with_middle, username: user[:username], password_digest: Faker::Lorem.characters(number:10) })
    assert_not second_user.save

    Faker::Name.unique.clear
  end
end
