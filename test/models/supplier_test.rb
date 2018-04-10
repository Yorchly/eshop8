require File.dirname(__FILE__) + '/../test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "test_name" do
    supplier = Supplier.create(:first_name => 'John', :last_name => 'Smith')
    assert_equal 'John Smith', supplier.name
  end
end
