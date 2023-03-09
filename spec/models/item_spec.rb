require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品登録' do
    cotext '出品できる時' do
      it '全て揃っている時' do
        expect(@item).to be_valid
      end
      it '商品名がブランク以外なら出品できる'do
        @item.item_name = ''
        expect(@item).to be_valid
      end
      it '説明文がブランク以外なら出品できる' do
        @item.explanation = ''
        expect(@item).to be_valid
      end
      it 'カテゴリーが(--)以外なら出品できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が(--)以外なら出品できる' do
        @item.situation_id = 1
        expect(@item).to be_valid
      end
      it '配送料が(--)以外なら出品できる' do
        @item.delivery_charge_id = 1
        expect(@item.).to be_valid
      end
      it '配送元が(--)以外なら出品できる' do
        @item.sender_id = 1
        expect(@item).to be_valid
      end
      it '配送日数が(--)以外なら出品できる' do
        @item.number_of_day_id = 1
        expect(@item).to be_valid
      end
      it '価格が300~9,999,999円の間だと出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it 'ユーザー登録していないと出品できない'
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
      it '画像がないと出品できない'
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない'
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明がないと出品できない'
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("explanation can't be blank")
      end
      it 'カテゴリーが空欄だと出品できない'
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が空欄だと出品できない'
        @item.situation_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '配送料が空欄だと出品できない'
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Dlivery charge can't be blank")
      end
      it '配送元が空欄だと出品できない'
        @item.sender_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it '発送日数が空欄だと出品できない'
        @item.number_of_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of day can't be blank")
      end
      it '価格が空欄だと出品できない'
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
