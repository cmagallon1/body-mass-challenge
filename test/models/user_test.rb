require 'test_helper'
require 'faker'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_save_user
    assert create(:user), "Can't save user"
  end

  def test_save_user_without_params
    user = User.new
    assert_not user.save, "Saved the user without params"
  end

  def test_save_user_with_username_under_limit
    user = build(:user, username: Faker::Name.initials(number: 4))
    assert_not user.save, "User saved with username under the limit"
  end

  def test_save_user_with_username_more_than_limit
    user = build(:user, username: Faker::Name.initials(number: 24))
    assert_not user.save, "User saved with password more than the limit"
  end

  def test_save_user_with_password_under_limit_password
    user = build(:user, password: Faker::Lorem.characters(number: 4))
    assert_not user.save, "User saved with password under the limit"
  end

  def test_save_user_with_password_more_than_limit
    user = build(:user, password: Faker::Lorem.characters(number: 24))
    assert_not user.save, "User saved with password more than the limit"
  end

  def test_save_user_without_email
    user = build(:user, email: "")
    assert_not user.save, "User saved without email"
  end
  
  def test_save_user_without_password
    user = build(:user, password: "")
    assert_not user.save, "User saved without email"
  end
  
  def test_save_user_without_username
    user = build(:user, username: "")
    assert_not user.save, "User saved without email"
  end

  def test_save_user_with_same_username
    user = build(:user)
    user.save
    second = build(:user, username: user[:username])
    assert_not second.save, "User saved with username already used"
  end
end
