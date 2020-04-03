class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  # belongs_to :category
  belongs_to :brand
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
end