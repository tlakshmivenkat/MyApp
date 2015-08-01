class Product < ActiveRecord::Base
  validates :title, :presence => true
  validates :price, :presence => true
  validates :description, :presence => true
  has_one :image, as: :entity
  accepts_nested_attributes_for :image

  # before_save do |user|
  #   self.title = "Ganesh"
  # end
end

