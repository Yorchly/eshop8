require File.dirname(__FILE__) + '/../test_helper'

class ProgramTest < ActiveSupport::TestCase
  fixtures :suppliers, :developers, :programs, :programs_suppliers

  test "failing_create" do
    program = Program.new
    assert_equal false, program.save
    assert_equal 7, program.errors.count
    assert program.errors[:name]
    assert program.errors[:kind]
    assert program.errors[:developer_id]
    assert program.errors[:developed_at]
    assert program.errors[:serial_number]
    assert program.errors[:price]
  end

  test "create" do
    program = Program.new(
      :name => 'Ruby on Rails',
      :suppliers => Supplier.all,
      :developer_id => Developer.find(1).id,
      :developed_at => Time.now,
      :serial_number => '12',
      :blurb => 'A great program',
      :kind => 375,
      :price => 45.5
    )
  assert program.save
  end

  test "has_many_and_belongs_to_mapping" do
    apress = Developer.find_by_name("Apress");
    count = apress.programs.count
    program = Program.new(
      :name => 'Pro Rails E-Commerce 8th Edition',
      :suppliers => [Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Supplier.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :developer_id => apress.id,
      :developed_at => Time.now,
      :serial_number => '13',
      :blurb => 'E-Commerce on Rails',
      :kind => 400,
      :price => 55.5
    )
    apress.programs << program
    apress.reload
    program.reload
    assert_equal count + 1, apress.programs.count
    assert_equal 'Apress', program.developer.name
  end

  test "has_many_and_belongs_to_many_suppliers_mapping" do
    program = Program.new(
      :name => 'Pro Rails E-Commerce 8th Edition',
      :suppliers => [Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Supplier.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :developer_id => Developer.find_by_name("Apress").id,
      :developed_at => Time.now,
      :serial_number => '13',
      :blurb => 'E-Commerce on Rails',
      :kind => 400,
      :price => 55.5
    )
    assert program.save
    program.reload
    assert_equal 2, program.suppliers.count
    assert_equal 2, Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky').programs.count
  end
end
