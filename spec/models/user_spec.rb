require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = User.new(email: "kkk@gmail.com")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
    it "passwordがない場合は登録できないこと" do
      user = User.new(password: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
  end
end