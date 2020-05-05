require 'test_helper'

class Company::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_home_index_url
    assert_response :success
  end

end
