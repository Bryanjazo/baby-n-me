require "test_helper"

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_message = api_v1_messages(:one)
  end

  test "should get index" do
    get api_v1_messages_url, as: :json
    assert_response :success
  end

  test "should create api_v1_message" do
    assert_difference('Api::V1::Message.count') do
      post api_v1_messages_url, params: { api_v1_message: { chat_room_id: @api_v1_message.chat_room_id, content: @api_v1_message.content, integer: @api_v1_message.integer } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_message" do
    get api_v1_message_url(@api_v1_message), as: :json
    assert_response :success
  end

  test "should update api_v1_message" do
    patch api_v1_message_url(@api_v1_message), params: { api_v1_message: { chat_room_id: @api_v1_message.chat_room_id, content: @api_v1_message.content, integer: @api_v1_message.integer } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_message" do
    assert_difference('Api::V1::Message.count', -1) do
      delete api_v1_message_url(@api_v1_message), as: :json
    end

    assert_response 204
  end
end
