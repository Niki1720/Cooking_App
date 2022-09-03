require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  def setup
    @unit = Unit.new(name: "mililitr", shortcut_name: "ml")
  end

  test 'unit should be valid' do
    assert @unit.valid?
  end
  test 'name should be present' do
    @unit.name = ' '
    assert_not @unit.valid?
  end

  test 'name should be unique' do
    @unit.save
    @unit2 = Unit.new(name: "mililitr", shortcut_name: "ml")
    assert_not @unit2.valid?
  end

  test 'name should not be too long' do
    @unit.name = 'a' * 16
    assert_not @unit.valid?
  end

  test "name should not be to short" do
    @unit.name = "a" * 2
    assert_not @unit.valid?
  end

end