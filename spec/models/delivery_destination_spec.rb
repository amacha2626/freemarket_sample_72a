require 'rails_helper'
describe DeliveryDestination do
  describe '#create' do
    it "destination_family_nameがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(destination_family_name: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:destination_family_name]).to include("can't be blank")
    end
    
    it "destination_first_nameがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(destination_first_name: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:destination_first_name]).to include("can't be blank")
    end
    
    it "destination_family_name_kanaがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(destination_family_name_kana: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:destination_family_name_kana]).to include("can't be blank")
    end
    
    it "destination_first_name_kanaがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(destination_first_name_kana: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:destination_first_name_kana]).to include("can't be blank")
    end
    
    it "postal_codeがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(postal_code: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:postal_code]).to include("can't be blank")
    end
    
    it "prefectureがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(prefecture: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:prefecture]).to include("can't be blank")
    end
    
    it "cityがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(city: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:city]).to include("can't be blank")
    end
    
    it "house_numberがない場合は登録できないこと" do
      delivery_destination = DeliveryDestination.new(house_number: "")
      delivery_destination.valid?
      expect(delivery_destination.errors[:house_number]).to include("can't be blank")
    end
    
    
  end
end
