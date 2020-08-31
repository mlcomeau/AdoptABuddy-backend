require 'test_helper'

class DecisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @decision = decisions(:one)
  end

  test "should get index" do
    get decisions_url, as: :json
    assert_response :success
  end

  test "should create decision" do
    assert_difference('Decision.count') do
      post decisions_url, params: { decision: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show decision" do
    get decision_url(@decision), as: :json
    assert_response :success
  end

  test "should update decision" do
    patch decision_url(@decision), params: { decision: {  } }, as: :json
    assert_response 200
  end

  test "should destroy decision" do
    assert_difference('Decision.count', -1) do
      delete decision_url(@decision), as: :json
    end

    assert_response 204
  end
end
