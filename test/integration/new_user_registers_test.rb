require 'test_helper'

class NewUserRegistersTest < ActionDispatch::IntegrationTest
  test "user is registered" do
    visit new_user_path
    fill_in "Name", with: "Steve"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"
    user = User.last
    assert_equal user_path(user), current_path
    assert page.has_content?("Steve")
    assert page.has_content?("Welcome to Tool Chest")
  end
end
