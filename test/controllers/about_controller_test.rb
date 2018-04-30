require 'test_helper'

class AboutControllerTest < ActionController::TestCase
	
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'about/index'
    assert_equal 'Sobre Softonic sin Virus', assigns(:page_title)
    assert_select 'title', 'Sobre Softonic sin Virus'
  end

end
