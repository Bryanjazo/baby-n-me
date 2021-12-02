require "test_helper"

class Api::V1::ConversationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_conversation = api_v1_conversations(:one)
  end

  test "should get index" do
    get api_v1_conversations_url, as: :json
    assert_response :success
  end

  test "should create api_v1_conversation" do
    assert_difference('Api::V1::Conversation.count') do
      post api_v1_conversations_url, params: { api_v1_conversation: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_conversation" do
    get api_v1_conversation_url(@api_v1_conversation), as: :json
    assert_response :success
  end

  test "should update api_v1_conversation" do
    patch api_v1_conversation_url(@api_v1_conversation), params: { api_v1_conversation: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_conversation" do
    assert_difference('Api::V1::Conversation.count', -1) do
      delete api_v1_conversation_url(@api_v1_conversation), as: :json
    end

    assert_response 204
  end
end
