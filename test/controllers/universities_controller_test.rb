require 'test_helper'

class UniversitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get universities_index_url
    assert_response :success
  end

  test "should get edit" do
    get universities_edit_url
    assert_response :success
  end

  test "should get new" do
    get universities_new_url
    assert_response :success
  end

  test "should get update" do
    get universities_update_url
    assert_response :success
  end

end
