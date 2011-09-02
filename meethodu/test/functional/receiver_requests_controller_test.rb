require 'test_helper'

class ReceiverRequestsControllerTest < ActionController::TestCase
  setup do
    @receiver_request = receiver_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receiver_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receiver_request" do
    assert_difference('ReceiverRequest.count') do
      post :create, :receiver_request => @receiver_request.attributes
    end

    assert_redirected_to receiver_request_path(assigns(:receiver_request))
  end

  test "should show receiver_request" do
    get :show, :id => @receiver_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @receiver_request.to_param
    assert_response :success
  end

  test "should update receiver_request" do
    put :update, :id => @receiver_request.to_param, :receiver_request => @receiver_request.attributes
    assert_redirected_to receiver_request_path(assigns(:receiver_request))
  end

  test "should destroy receiver_request" do
    assert_difference('ReceiverRequest.count', -1) do
      delete :destroy, :id => @receiver_request.to_param
    end

    assert_redirected_to receiver_requests_path
  end
end
