require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it "costomer_idがない場合は登録できないこと" do
      card = CreditCard.new(costomer_id: "")
      card.valid?
      expect(card.errors[:costomer_id]).to include("can't be blank")
    end

    it "card_idがない場合は登録できないこと" do
      card = CreditCard.new(card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
    
  end
end
