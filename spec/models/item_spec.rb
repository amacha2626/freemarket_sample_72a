require 'rails_helper'
describe Item do
  describe '#create' do
    it "商品名がない場合は登録できないこと" do
      item = Item.new(name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "商品説明がない場合は登録できないこと" do
      item = Item.new(description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "カテゴリーがない場合は登録できないこと" do
      item = Item.new(category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "商品の状態がない場合は登録できないこと" do
      item = Item.new(condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "配送料の負担額がない場合は登録できないこと" do
      item = Item.new(postage_payer: "")
      item.valid?
      expect(item.errors[:postage_payer]).to include("can't be blank")
    end

    it "配送元の地域がない場合は登録できないこと" do
      item = Item.new(shipping_from: "")
      item.valid?
      expect(item.errors[:shipping_from]).to include("can't be blank")
    end

    it "発送までの日数がない場合は登録できないこと" do
      item = Item.new(necessary_days: "")
      item.valid?
      expect(item.errors[:necessary_days]).to include("can't be blank")
    end

    it "販売価格がない場合は登録できないこと" do
      item = Item.new(price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  end
end