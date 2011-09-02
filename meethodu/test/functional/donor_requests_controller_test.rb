require 'test_helper'

class DonorRequestsControllerTest < ActionController::TestCase
  setup do
    @donor_request = donor_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donor_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donor_request" do
    assert_difference('DonorRequest.count') do
      post :create, :donor_request => @donor_request.attributes
    end

    assert_redirected_to donor_request_path(assigns(:donor_request))
  end

  test "should show donor_request" do
    get :show, :id => @donor_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @donor_request.to_param
    assert_response :success
  end

  test "should update donor_request" do
    put :update, :id => @donor_request.to_param, :donor_request => @donor_request.attributes
    assert_redirected_to donor_request_path(assigns(:donor_request))
  end

  test "should destroy donor_request" do
    assert_difference('DonorRequest.count', -1) do
      delete :destroy, :id => @donor_request.to_param
    end

    assert_redirected_to donor_requests_path
  end
end
