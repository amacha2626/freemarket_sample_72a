require 'rails_helper'
describe User do
  describe '#create' do
    it "family_nameがない場合は登録できないこと" do
     user = build(:user, family_name: nil)
     user.valid?
     expect(user.errors[:family_name]).to include("を入力してください","は不正な値です")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください","は不正な値です")
    end
    
    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください","は不正な値です")
    end
    
    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください","は不正な値です")
    end
    
    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    
  end
end