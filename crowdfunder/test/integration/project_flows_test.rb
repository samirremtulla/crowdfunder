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

    assert page.has_content?('Projects')
    assert page.has_content?('Waterproof Whiteboard')
    assert page.has_content?('Something else')
    assert page.has_content?('Wifi-enabled lamps!')

    #Monica's stuff
    click_link 'Waterproof Whiteboard'
    assert_equal project_path(p2), current_path
    assert find('h1:first').has_content? p2.title
  end

  test "navigation" do
    visit "/"
    assert_equal root_path, current_path
    assert_equal "Home", find("ul.nav li.active a").text
  
    visit "/projects"
    assert_equal projects_path, current_path
    assert_equal "Projects", find("ul.nav li.active a").text


  end

  test "show" do
    p1 = FactoryGirl.create(:project, title: "Bowls")
    visit "/projects/#{p1.id}"
    assert_equal project_path(p1), current_path
    assert page.has_content?('Bowls')
    assert page.has_content?("#{p1.user.first_name} #{p1.user.last_name}")
  end


  
end
