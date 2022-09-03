require "test_helper"

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit = Unit.create(name: "mililitry", shortcut_name: "ml")
    @admin_user = User.create(username: "Admin", email: "admin@wp.pl", password: "haslo123", admin: true)
  end

  test "should get index" do
    get units_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_unit_url
    assert_response :success
  end

  test "should  create unit" do
    sign_in_as(@admin_user)
    assert_difference('Unit.count',1) do
      post units_url, params: { unit: { name: "kilogramy", shortcut_name: "kg"  } }
    end

    assert_redirected_to unit_url(Unit.last)
  end

  test "should not create unit if not admin" do
    assert_no_difference('Unit.count') do
      post units_url, params: { unit: {name: "Mililitr"  } }
    end

    assert_redirected_to units_url
  end

  test "should show unit" do
    get unit_url(@unit)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_unit_url(@unit)
  #   assert_response :success
  # end
  #
  # test "should update unit" do
  #   patch unit_url(@unit), params: { unit: {  } }
  #   assert_redirected_to unit_url(@unit)
  # end
  #
  # test "should destroy unit" do
  #   assert_difference('Unit.count', -1) do
  #     delete unit_url(@unit)
  #   end
  #
  #   assert_redirected_to units_url
  # end
end
