require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品できる時' do
      it '全て揃っている時' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが(--)以外なら出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態が(--)以外なら出品できる' do
        @item.situation_id = 2
        expect(@item).to be_valid
      end
      it '配送料が(--)以外なら出品できる' do
        @item.delivery_charge_id = 2
        expect(@item).to be_valid
      end
      it '配送元が(--)以外なら出品できる' do
        @item.sender_id = 2
        expect(@item).to be_valid
      end
      it '配送日数が(--)以外なら出品できる' do
        @item.number_of_day_id = 2
        expect(@item).to be_valid
      end
      it '価格が300~9,999,999円の間だと出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it 'ユーザー登録していないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it '商品名がないと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明がないと出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーが空欄だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品状態が空欄だと出品できない' do
        @item.situation_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料が空欄だと出品できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '配送元が空欄だと出品できない' do
        @item.sender_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送日数が空欄だと出品できない' do
        @item.number_of_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
      end
      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it 'カテゴリーに(---)が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態に(---)が選択されている場合は出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
        it '配送料に(---)が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元地域に(---)が選択されている場合は出品できない' do
        @item.sender_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送までの日数に(---)が選択されている場合は出品できない' do
        @item.number_of_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を選択してください")
      end
      it '価格は半角でないと登録出来ない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

    end
  end
end
