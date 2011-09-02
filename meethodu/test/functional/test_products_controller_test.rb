require 'test_helper'

class TestProductsControllerTest < ActionController::TestCase
  setup do
    @test_product = test_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_product" do
    assert_difference('TestProduct.count') do
      post :create, :test_product => @test_product.attributes
    end

    assert_redirected_to test_product_path(assigns(:test_product))
  end

  test "should show test_product" do
    get :show, :id => @test_product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @test_product.to_param
    assert_response :success
  end

  test "should update test_product" do
    put :update, :id => @test_product.to_param, :test_product => @test_product.attributes
    assert_redirected_to test_product_path(assigns(:test_product))
  end

  test "should destroy test_product" do
    assert_difference('TestProduct.count', -1) do
      delete :destroy, :id => @test_product.to_param
    end

    assert_redirected_to test_products_path
  end
end
