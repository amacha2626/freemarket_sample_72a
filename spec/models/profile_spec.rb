require 'rails_helper'
describe Profile do
  describe '#create' do
    it "family_nameがない場合は登録できないこと" do
      profile = Profile.new(family_name: "")
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      profile = Profile.new(first_name: "")
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be blank")
    end
    
    it "family_name_kanaがない場合は登録できないこと" do
      profile = Profile.new(family_name_kana: "")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    end
    
    it "first_name_kanaがない場合は登録できないこと" do
      profile = Profile.new(first_name_kana: "")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    end
    
    it "birth_dayがない場合は登録できないこと" do
      profile = Profile.new(birth_day: "")
      profile.valid?
      expect(profile.errors[:birth_day]).to include("can't be blank")
    end
    
  end
end