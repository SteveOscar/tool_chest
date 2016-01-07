# require 'test_helper'
#
# class UserCanCreateAToolTest < ActionDispatch::IntegrationTest
#   test "logged in user can create a tool" do
#     user = User.create(name: "Carl", password: "password")
#
#     visit login_path
#     fill_in "Name", with: "#{user.name}"
#     fill_in "Password", with: "password"
#     click_on "Login"
#     click_link "Add Tool"
#     fill_in "Name", with: "Grinder"
#     fill_in "Use", with: "smoothing stuff"
#     click_on "Submit"
#     assert page.has_content?("Grinder")
#     assert_equal user_path(user), current_path
#   end
# end
