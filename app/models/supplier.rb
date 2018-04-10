class Supplier < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, :in => 2..55

  def name
    "#{first_name} #{last_name}"
  end
end
