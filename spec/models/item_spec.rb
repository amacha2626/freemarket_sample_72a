require 'rails_helper'
describe Item do
  describe '#create' do
    it "出品画像がない場合は登録できないこと" do
      item = build(:item, item_image: nil)
      item.valid?
      expect(item.errors[:item_image]).to include("を入力してください")
    end

    it "商品名がない場合は登録できないこと" do
      item = build(:item, item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("を入力してください")
    end

    it "商品説明がない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "カテゴリーがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "商品の状態がない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "配送料の負担額がない場合は登録できないこと" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end

    it "配送元の地域がない場合は登録できないこと" do
      item = build(:item, shipping_from: nil)
      item.valid?
      expect(item.errors[:shipping_from]).to include("を入力してください")
    end

    it "発送までの日数がない場合は登録できないこと" do
      item = build(:item, necessary_days: nil)
      item.valid?
      expect(item.errors[:necessary_days]).to include("を入力してください")
    end

    it "販売価格がない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "入力必須項目が存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

  end
end