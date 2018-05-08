require File.dirname(__FILE__) + '/../test_helper'

class ProgramAdministrationTest < ActionDispatch::IntegrationTest

  test "program_aministration" do
    developer = Developer.create(:name => 'Programs of Ruby')
    supplier = Supplier.create(:first_name => 'John', :last_name => 'Anderson')
    george = new_session_as(:george)

    new_program_ruby = george.add_program :program => {
      :name => 'A new Program of Ruby',
      :developer_id => developer.id,
      :supplier_ids => [supplier.id],
      :developed_at => Time.now,
      :serial_number => '123',
      :blurb => 'A new Program of Ruby',
      :kind => 'Juego',
      :price => 45
    }

    george.list_programs
    george.show_program new_program_ruby

    george.edit_program new_program_ruby, :program => {
      :name => 'A very new Program of Ruby',
      :developer_id => developer.id,
      :supplier_ids => [supplier.id],
      :developed_at => Time.now,
      :serial_number => '123',
      :blurb => 'A very new Program of Ruby',
      :kind => 'Prueba',
      :price => 50
    }

    bob = new_session_as(:bob)
    bob.delete_program new_program_ruby
  end

  private

  module ProgramTestDSL
    attr_writer :name

    def add_program(parameters)
      supplier = Supplier.first
      developer = Developer.first
      get '/admin/program/new'
      assert_response :success
      assert_template 'admin/program/new'
      assert_select 'select#program_developer_id' do
        assert_select "option[value=\"#{developer.id}\"]", developer.name
      end
      # assert_tag :tag => 'option', :attributes => { :value => developer.id }
      assert_select "select[name=\"program[supplier_ids][]\"]" do
        assert_select "option[value=\"#{supplier.id}\"]", supplier.name
      end
      # assert_tag :tag => 'select', :attributes => { :name => 'program[supplier_ids][]' }
      post '/admin/program/create', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/program/index'
      page = Program.all.count / 5 + 1
      get "/admin/program/index/?page=#{page}"
      assert_select 'td', parameters[:program][:name]
      # assert_tag :tag => 'td', :content => parameters[:program][:name]
      program = Program.find_by_name(parameters[:program][:name])
      return program;
    end

    def edit_program(program, parameters)
      get "/admin/program/edit?id=#{program.id}"
      assert_response :success
      assert_template 'admin/program/edit'
      post "/admin/program/update?id=#{program.id}", parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/program/show'
    end

    def delete_program(program)
      post "/admin/program/destroy?id=#{program.id}"
      assert_response :redirect
      follow_redirect!
      assert_template 'admin/program/index'
    end

    def show_program(program)
      get "/admin/program/show/#{program.id}"
      assert_response :success
      assert_template 'admin/program/show'
    end

    def list_programs
      get '/admin/program/index'
      assert_response :success
      assert_template 'admin/program/index'
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(ProgramTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
