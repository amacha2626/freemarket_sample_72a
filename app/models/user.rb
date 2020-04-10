class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_one :delivery_destination, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :buyer_items, foreign_key: "buyer_id", class_name: 'Items'
  has_many :seller_items, foreign_key: "seller_id", class_name: 'Items'
  

    validates :nickname, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: {minimum: 7}


end
