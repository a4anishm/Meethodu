require 'test_helper'

class FriendshipSentRequestsControllerTest < ActionController::TestCase
  setup do
    @friendship_sent_request = friendship_sent_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friendship_sent_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friendship_sent_request" do
    assert_difference('FriendshipSentRequest.count') do
      post :create, :friendship_sent_request => @friendship_sent_request.attributes
    end

    assert_redirected_to friendship_sent_request_path(assigns(:friendship_sent_request))
  end

  test "should show friendship_sent_request" do
    get :show, :id => @friendship_sent_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @friendship_sent_request.to_param
    assert_response :success
  end

  test "should update friendship_sent_request" do
    put :update, :id => @friendship_sent_request.to_param, :friendship_sent_request => @friendship_sent_request.attributes
    assert_redirected_to friendship_sent_request_path(assigns(:friendship_sent_request))
  end

  test "should destroy friendship_sent_request" do
    assert_difference('FriendshipSentRequest.count', -1) do
      delete :destroy, :id => @friendship_sent_request.to_param
    end

    assert_redirected_to friendship_sent_requests_path
  end
end
