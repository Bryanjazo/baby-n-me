require "test_helper"

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_session = api_v1_sessions(:one)
  end

  test "should get index" do
    get api_v1_sessions_url, as: :json
    assert_response :success
  end

  test "should create api_v1_session" do
    assert_difference('Api::V1::Session.count') do
      post api_v1_sessions_url, params: { api_v1_session: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_session" do
    get api_v1_session_url(@api_v1_session), as: :json
    assert_response :success
  end

  test "should update api_v1_session" do
    patch api_v1_session_url(@api_v1_session), params: { api_v1_session: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_session" do
    assert_difference('Api::V1::Session.count', -1) do
      delete api_v1_session_url(@api_v1_session), as: :json
    end

    assert_response 204
  end
end
