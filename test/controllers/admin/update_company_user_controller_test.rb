require 'test_helper'

class Admin::UpdateCompanyUserControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_update_company_user_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_update_company_user_update_url
    assert_response :success
  end

end
