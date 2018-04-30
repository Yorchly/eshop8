require 'test_helper'

class Admin::DeveloperControllerTest < ActionController::TestCase
  fixtures :developers

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_developers = Developer.count
    post :create, :developer => { :name => 'The Monopoly Publishing Company' }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal num_developers + 1, Developer.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_select 'input' do
      assert_select '[type=?]', 'text'
      assert_select '[name=?]', 'developer[name]'
      assert_select '[value=?]', 'Apress'
    end
  end

  test "update" do
    post :update, :id => 1, :developer => { :name => 'Apress.com' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Apress.com', Developer.find(1).name
  end

  test "destroy" do
    assert_difference(Developer, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Apress eliminado correctamente.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_select 'div#notice', 'Apress eliminado correctamente.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'admin/developer/show'
    assert_not_nil assigns(:developer)
    assert assigns(:developer).valid?
    assert_select 'div#content' do
      assert_select 'h1', Developer.find(1).name
    end
  end

  test "index" do
    get :index
    assert_response :success
    assert_select 'table' do
      assert_select 'tr', Developer.count + 1
    end
    Developer.find_each do |a|
      assert_select 'td', a.name
    end
  end

end
