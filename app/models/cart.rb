class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :programs, :through => :cart_items

  def add(program_id)
    items = cart_items.where(program_id: program_id)
    program = Program.find program_id
    if items.size < 1
      ci = cart_items.create :program_id => program_id, :amount => 1, :price => program.price
    else
      ci = items.first
      ci.update_attribute :amount, ci.amount + 1
    end
    ci
  end

  def remove(program_id)
    ci = cart_items.where(program_id: program_id).first
    if ci.amount > 1
      ci.update_attribute :amount, ci.amount - 1
    else
      CartItem.destroy ci.id
    end
    ci
  end


  def total
    sum = 0
    cart_items.each do |item| sum += item.price * item.amount end
    sum
  end
end
