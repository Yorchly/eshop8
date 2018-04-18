class Program < ActiveRecord::Base
  has_and_belongs_to_many :suppliers
  belongs_to :developer

  #has_many :cart_items
  #has_many :carts, :through => :cart_items

  #has_attached_file :cover_image
  #validates_attachment :cover_image,
  #:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  validates_length_of :name, :in => 1..255
  validates_length_of :type, :in => 1..255
  validates_presence_of :developer
  validates_presence_of :suppliers
  validates_presence_of :developed_at
  validates_numericality_of :price
  validates_length_of :serial_number, :in => 1..5
  validates_uniqueness_of :serial_number

  def suplier_names
    self.suppliers.map{|suplier| suplier.name}.join(", ")
  end

  def self.latest(num)
    all.order("program.id desc").includes(:suppliers, :developer).limit(num)
  end
end
