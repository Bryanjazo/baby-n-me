require "test_helper"

class Api::V1::SellingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_selling = api_v1_sellings(:one)
  end

  test "should get index" do
    get api_v1_sellings_url, as: :json
    assert_response :success
  end

  test "should create api_v1_selling" do
    assert_difference('Api::V1::Selling.count') do
      post api_v1_sellings_url, params: { api_v1_selling: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_selling" do
    get api_v1_selling_url(@api_v1_selling), as: :json
    assert_response :success
  end

  test "should update api_v1_selling" do
    patch api_v1_selling_url(@api_v1_selling), params: { api_v1_selling: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_selling" do
    assert_difference('Api::V1::Selling.count', -1) do
      delete api_v1_selling_url(@api_v1_selling), as: :json
    end

    assert_response 204
  end
end
