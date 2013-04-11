require 'test_helper'

class My::ProjectFlowsTest < ActionDispatch::IntegrationTest


  test "lists only my projects" do
    
    me = setup_signed_in_user
    other_user = FactoryGirl.create :user

    5.times {FactoryGirl.create :project, user: me}
    3.times {FactoryGirl.create :project, user: other_user, title: "Not me"}
    #create projects for user 1
    #create projects for user 2

    #visit page
    visit '/my/projects'
    #check
    assert page.has_no_content?("Not me")
  end

  test "can not edit someone elses projects" do

    me = setup_signed_in_user
    other_user = FactoryGirl.create :user

    project = FactoryGirl.create :project, user: other_user

    visit edit_my_project_path(project)

    assert has_content?(nil)

  end

  test "successful creation of projects makes it available right away" do
    me = setup_signed_in_user
    project = FactoryGirl.create :project, user: me

    visit "/my/projects/#{project.id}/edit"

    fill_in 'project_title', with: "hello"
    click_button 'Update'

    visit '/projects'

    assert has_content?("hello")
  end

  test "have button to create new project" do
    setup_signed_in_user

    visit "/my/projects"
    assert has_content?("New Project")
  end

  test "click new project redirects to new project page" do
    setup_signed_in_user

    visit "/my/projects"
    find('.btn-primary').click_link 'New Project'

    assert_equal new_my_project_path,current_path
  end

  test "new project page has form fields" do
    setup_signed_in_user

    visit "/my/projects/new"

    assert page.has_field?("project_title")
    assert page.has_field?("project_teaser")
    assert page.has_field?("project_description")
    assert page.has_field?("project_goal")
    assert has_button?("Create")
  end

  test "creates new project adds to database" do
    setup_signed_in_user

    visit "/my/projects/new"

    fill_in "project_title", :with => "Elephants"
    fill_in "project_teaser", :with => "Its cool"
    fill_in "project_description", :with => "Wicked"
    fill_in "project_goal", :with => 500
    click_button "Create"

    assert_equal current_path, projects_path
    assert has_content?("Elephants")
  end

  test "creates new project and adds to my/projects" do
    setup_signed_in_user

    visit "/my/projects/new"

    fill_in "project_title", :with => "Elephants"
    fill_in "project_teaser", :with => "Its cool"
    fill_in "project_description", :with => "Wicked"
    fill_in "project_goal", :with => 500
    click_button "Create"

    visit "/my/projects"
    assert has_content?("Elephants")
  end

  test "redirects to login when signed-out" do
    visit "/my/projects"

    assert has_content?("Please login first")
    assert_equal new_session_path, current_path

  end





end