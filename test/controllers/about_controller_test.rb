require 'test_helper'

class AboutControllerTest < ActionController::TestCase
	
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'about/index'
    assert_equal 'About Eshop8', assigns(:page_title)
    assert_select 'title', 'About Eshop8'
  end

end
