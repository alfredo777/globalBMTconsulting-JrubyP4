require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get calendar_table" do
    get :calendar_table
    assert_response :success
  end

  test "should get open_event" do
    get :open_event
    assert_response :success
  end

end
