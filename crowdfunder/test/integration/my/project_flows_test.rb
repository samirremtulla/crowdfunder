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


end