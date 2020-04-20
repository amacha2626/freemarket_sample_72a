class CreditCard < ApplicationRecord
  belongs_to :user

  validates :costomer_id, :card_id, presence: true
end
