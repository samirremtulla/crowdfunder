require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "the index page lists all our projects" do
    visit '/projects'
    assert page.has_content?('Listing Projects')
  end

end
