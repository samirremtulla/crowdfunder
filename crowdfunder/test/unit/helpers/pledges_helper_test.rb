require 'test_helper'

class PledgesHelperTest < ActionView::TestCase

  #amount is an integer
  #must have a value

  setup do
    @p = FactoryGirl.create(:pledge)
    assert @p.valid?
  end

  # def test_must_have_a_description
  test "must be an integer" do
    @p.amount = 1.23
    refute @p.valid?
  end

  test "must have a value" do 
    @p.amount = ""
    refute @p.valid?
  end


end
