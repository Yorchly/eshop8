require File.dirname(__FILE__) + '/../test_helper'

class BrowsingAndSearchingTest < ActionDispatch::IntegrationTest
  fixtures :developers, :suppliers, :programs, :programs_suppliers

  test "browse" do
    jill = new_session_as :jill
    jill.index
    jill.second_page
    jill.program_details 'Pride and Prejudice'
    jill.latest_programs
  end

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def index
      get '/catalog/index'
      assert_response :success
      assert_select 'dl#programs' do
        assert_select 'dt', :count => 5
      end
      assert_select 'dt' do
        assert_select 'a', 'The Idiot'
      end
      check_program_links
    end

    def second_page
      get '/catalog/index?page=2'
      assert_response :success
      assert_template 'catalog/index'
      assert_equal Program.find_by_name('Pro Rails E-Commerce'),
                   assigns(:programs).last
      check_program_links
    end

    def program_details(name)
      @program = Program.where(:name => name).first
      get "/catalog/show/#{@program.id}"
      assert_response :success
      assert_template 'catalog/show'
      assert_select 'div#content' do
        assert_select 'h1', @program.name
        assert_select 'h2', "Por #{@program.suppliers.map{|a| a.name}.join(", ")}"
      end
    end

    def latest_programs
      get '/catalog/latest'
      assert_response :success
      assert_template 'catalog/latest'
      assert_select 'dl#programs' do
        assert_select 'dt', :count => 5
      end

      @programs = Program.latest(5)
      @programs.each do |a|
        assert_select 'dt' do
          assert_select 'a', a.name
        end
      end
    end

    def check_program_links
      for program in assigns :programs
        assert_select 'a' do
          assert_select '[href=?]', "/catalog/show/#{program.id}"
        end
      end
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
