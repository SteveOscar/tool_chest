require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  test "logged in user can log out" do
    user = User.create(name: "Alex", password: "password")

    visit login_path
    fill_in "Name", with: "#{user.name}"
    fill_in "Password", with: "password"
    click_button "Login"
    click_link "Log Out"
    assert page.has_content?("Successfully Logged Out")
  end
end
