require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get sites" do
    get admins_sites_url
    assert_response :success
  end

end
