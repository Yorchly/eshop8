require 'test_helper'

class CartControllerTest < ActionController::TestCase
  fixtures :suppliers, :developers, :programs

  test "add" do
    assert_difference(CartItem, :count) do
      post :add, :id => 4
    end
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end

  test "remove" do
    post :add, :id => 4
    assert_equal [Program.find(4)], Cart.find(@request.session[:cart_id]).programs

    post :remove, :id => 4
    assert_equal [], Cart.find(@request.session[:cart_id]).programs
  end

  test "clear" do
    post :add, :id => 4

    post :add, :id => 5

    assert_equal [Program.find(4)], [Program.find(5)], Cart.find(@request.session[:cart_id]).programs
    post :clear
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal [], Cart.find(@request.session[:cart_id]).programs
  end
end