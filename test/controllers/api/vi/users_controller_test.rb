require "test_helper"

class Api::Vi::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_vi_user = api_vi_users(:one)
  end

  test "should get index" do
    get api_vi_users_url, as: :json
    assert_response :success
  end

  test "should create api_vi_user" do
    assert_difference('Api::Vi::User.count') do
      post api_vi_users_url, params: { api_vi_user: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_vi_user" do
    get api_vi_user_url(@api_vi_user), as: :json
    assert_response :success
  end

  test "should update api_vi_user" do
    patch api_vi_user_url(@api_vi_user), params: { api_vi_user: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_vi_user" do
    assert_difference('Api::Vi::User.count', -1) do
      delete api_vi_user_url(@api_vi_user), as: :json
    end

    assert_response 204
  end
end
