require "test_helper"

class Api::V1::ChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_channel = api_v1_channels(:one)
  end

  test "should get index" do
    get api_v1_channels_url, as: :json
    assert_response :success
  end

  test "should create api_v1_channel" do
    assert_difference('Api::V1::Channel.count') do
      post api_v1_channels_url, params: { api_v1_channel: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_channel" do
    get api_v1_channel_url(@api_v1_channel), as: :json
    assert_response :success
  end

  test "should update api_v1_channel" do
    patch api_v1_channel_url(@api_v1_channel), params: { api_v1_channel: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_channel" do
    assert_difference('Api::V1::Channel.count', -1) do
      delete api_v1_channel_url(@api_v1_channel), as: :json
    end

    assert_response 204
  end
end
