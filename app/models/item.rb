class Item < ApplicationRecord
  has_many :item_images
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brands
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :brand
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
end
