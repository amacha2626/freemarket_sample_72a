class Item < ApplicationRecord
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates_associated :item_images
  validates :item_images, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition, presence: true
  validates :postage_payer, presence: true
  validates :shipping_from, presence: true
  validates :necessary_days, presence: true
  validates :price, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true
end
