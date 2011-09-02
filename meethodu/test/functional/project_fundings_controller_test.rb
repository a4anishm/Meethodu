require 'test_helper'

class ProjectFundingsControllerTest < ActionController::TestCase
  setup do
    @project_funding = project_fundings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_fundings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_funding" do
    assert_difference('ProjectFunding.count') do
      post :create, :project_funding => @project_funding.attributes
    end

    assert_redirected_to project_funding_path(assigns(:project_funding))
  end

  test "should show project_funding" do
    get :show, :id => @project_funding.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @project_funding.to_param
    assert_response :success
  end

  test "should update project_funding" do
    put :update, :id => @project_funding.to_param, :project_funding => @project_funding.attributes
    assert_redirected_to project_funding_path(assigns(:project_funding))
  end

  test "should destroy project_funding" do
    assert_difference('ProjectFunding.count', -1) do
      delete :destroy, :id => @project_funding.to_param
    end

    assert_redirected_to project_fundings_path
  end
end
