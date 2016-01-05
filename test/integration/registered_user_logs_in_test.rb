require 'test_helper'

class RegisteredUserLogsInTest < ActionDispatch::IntegrationTest
  test "existing user can login" do
  user = User.create(name: "Carl", password: "password")

  visit login_path
  fill_in "Name", with: "#{user.name}"
  fill_in "Password", with: "password"
  click_on "Login"

  assert_equal user_path(user), current_path
  assert page.has_content?("Carl")
  assert page.has_content?("Welcome Back")
end
end
