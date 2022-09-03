require "test_helper"

class CreateUnitTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "Admin", email: "admin@wp.pl", password: "haslo123", admin: true)
    sign_in_as(@admin_user)
  end


  test "get new unit form and create unit" do
    get "/units/new"
    assert_response :success
    assert_difference 'Unit.count',1 do
      post units_path, params: {unit: {name: "Kilogram", shortcut_name: "kg"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Kilogram", response.body
  end

  test "get new unit form and reject invalid unit submission" do
    get "/units/new"
    assert_response :success
    assert_no_difference 'Unit.count' do
      post units_path, params: {unit: {name: " ", shortcut_name: " "}}
    end
    assert_match "errors", response.body
    assert_select 'div.error'
    assert_select 'div.header'
  end
end
