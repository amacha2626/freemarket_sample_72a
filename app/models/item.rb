class Item < ApplicationRecord
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true
end
