require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "the index page lists all our projects" do
    p1 = FactoryGirl.create(:project)
    p2 = FactoryGirl.create(:project, title: "Waterproof Whiteboard")
    p3 = FactoryGirl.create(:project, title: "Something else")

    visit '/projects'

    assert page.has_content?('Listing Projects')
    assert page.has_content?('Waterproof Whiteboard')
    assert page.has_content?('Something else')
    assert page.has_content?('Wifi-enabled lamps!')
  end
  
end
