require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "以下が存在すれば登録ができる
          image、name、description、category_id、condition_id、price、
          shipping_id、prefecture_id、days_to_ship_id、user_id" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do

      it "imageがなければ登録ができない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameがなければ登録ができない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionがなければ登録ができない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idがなければ登録ができない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "category_idにおいてid:1『--』を選択されている状態では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idがなければ登録ができない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "condition_idにおいてid:1『--』を選択されている状態では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "priceがなければ登録ができない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円以下であれば登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999円以上であると登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが整数以外であると登録できない" do
        @item.price = 500.3
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
        @item.price = "hoge"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        @item.price = "アイウエオ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        @item.price = "あいうえお"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        @item.price = "田中"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        @item.price = 'ａａａａ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        @item.price = 'ﾀﾅｶ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        @item.price = '@!-'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "shipping_idがなければ登録ができない" do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end
      it "shipping_idにおいてid:1『--』を選択されている状態では登録できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it "prefecture_idがなければ登録ができない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "prefecture_idにおいてid:1『--』を選択されている状態では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "days_to_ship_idがなければ登録ができない" do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end
      it "days_to_ship_idにおいてid:1『--』を選択されている状態では登録できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
      end

    end
  end
end