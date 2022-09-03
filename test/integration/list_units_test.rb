require "test_helper"

class ListUnitsTest < ActionDispatch::IntegrationTest
  def setup
    @unit = Unit.create(name: "Kiligram", shortcut_name: "kg")
    @unit2 = Unit.create(name: "Mililitr", shortcut_name: "ml")
  end

  test "should show units listing" do
    get '/units'
    assert_select "a[href=?]", unit_path(@unit), text: @unit.name
    assert_select "a[href=?]", unit_path(@unit2), text: @unit2.name

  end
end
