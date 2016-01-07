require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "logged in admin sees tools index" do
    admin = User.create(name: "admin", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    admin.tools.create(name: "hammer", use: "work")
    visit admin_tools_path
    assert page.has_content?("Tools Index")
  end

  test 'default user does not see admin tools index or new tool' do
    user = User.create(name: "default_user",
                       password: "password",
                       role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_tools_path
    refute page.has_content?("Tools Index")
    assert page.has_content?("The page you were looking for doesn't exist.")

    visit new_admin_tool_path
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test "admin can create a tool" do
    admin = User.create(name: "admin", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_tool_path
    fill_in "Name", with: "Drill"
    fill_in "Use", with: "Making Holes"
    fill_in "User", with: 980190963
    click_button "Submit"
    assert page.has_content?("Welcome")
  end


end
