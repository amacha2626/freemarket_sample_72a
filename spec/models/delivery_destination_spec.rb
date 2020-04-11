require 'rails_helper'
describe delivery_destination do
  describe '#create' do
    it "destination_family_nameがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, destination_family_name: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:destination_family_name]).to include("を入力してください", "は不正な値です")
    end
    
    it "destination_first_nameがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, destination_first_name: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:destination_first_name]).to include("を入力してください", "は不正な値です")
    end
    it "destination_family_name_kanaがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, destination_family_name_kana: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:destination_family_name]).to include("を入力してください", "は不正な値です")
    end
    
    it "destination_first_name_kanaがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, destination_first_name_kana: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:destination_first_name]).to include("を入力してください", "は不正な値です")
    end
    
    it "postal_codeがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, postal_code: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:postal_code]).to include("を入力してください")
    end
    
    it "prefectureがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, prefecture: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:prefecture]).to include("を入力してください")
    end
    
    it "cityがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, city: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:city]).to include("を入力してください")
    end
    it "house_numberがない場合は登録できないこと" do
      delivery_destination = build(:delivery_destination, house_number: nil)
      delivery_destination.valid?
     expect(delivery_destination.errors[:house_number]).to include("を入力してください")
    end
    
    
  end
end