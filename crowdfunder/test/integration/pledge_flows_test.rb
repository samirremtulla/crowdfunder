require 'test_helper'

class PledgeFlowsTest < ActionDispatch::IntegrationTest
  
  setup do
    @project = FactoryGirl.create :project    
  end

  test "requires authenticated user" do 
    visit project_path(@project)

    click_button 'Create Pledge'

    assert_equal new_session_path, current_path
    assert page.has_content?("Please login first")
  end

  test "authenticated user can pledge valid amount" do 
    user = setup_signed_in_user

    visit project_path(@project)

    assert_equal 0, Pledge.count

    fill_in 'pledge_amount', with: 100
    click_button 'Create Pledge'

    # Should be Redirected back to project page with thank you message
    assert_equal root_path, current_path
    assert page.has_content?("Thanks for pledging!")

    # Verify that the pledge was created with the right attributes
    assert pledge = Pledge.order(:id).last
    assert_equal user.id, pledge.user.id
    assert_equal @project.id, pledge.project.id
    assert_equal 100, pledge.amount
  end

end