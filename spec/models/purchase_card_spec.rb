require 'rails_helper'

RSpec.describe PurchaseCard, type: :model do

  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_card = FactoryBot.build(:purchase_card, user_id: user.id, item_id: item.id)
    end

    context '配送先情報が保存される時' do
      it '全ての情報が入力されていれば登録される' do
        expect(@purchase_card).to be_valid
      end
      it '郵便番号が正しく入力されていれば登録できる' do
        @purchase_card.post_code = '123-4567'
        expect(@purchase_card).to be_valid
      end
      it '都道府県が(--)かつ空でなければ登録できる' do
        @purchase_card.sender_id = 2
        expect(@purchase_card).to be_valid
      end
      it '市区町村が入力されていれば登録できる' do
        @purchase_card.city = '取手市'
        expect(@purchase_card).to be_valid
      end
      it '番地が入力されていれば登録できる' do
        @purchase_card.city_number = '取手1234'
        expect(@purchase_card).to be_valid
      end
      it '建物名は入力されていなくても登録できる' do
        @purchase_card.building_name = nil
        expect(@purchase_card).to be_valid
      end
      it '電話番号が11桁以内であれば登録できる' do
        @purchase_card.telephone_number = 12_345_678_987
        expect(@purchase_card).to be_valid
      end
      it 'user_idがあれば登録できる' do
        @purchase_card.user_id = 1
        expect(@purchase_card).to be_valid
      end
      it 'item_idがあれば登録できる' do
        @purchase_card.item_id = 1
        expect(@purchase_card).to be_valid
      end
    end

    context '配送先情報が保存されない場合' do
      it '郵便番号がないと登録できない' do
        @purchase_card.post_code = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないと登録出来ない' do
        @purchase_card.post_code = '1000011'
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が(--)だと登録出来ない' do
        @purchase_card.sender_id = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村が空だと登録できない' do
        @purchase_card.city = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと登録できない' do
        @purchase_card.city_number = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと登録できない' do
        @purchase_card.telephone_number = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンがあると登録できない' do
        @purchase_card.telephone_number = '123 - 2345 - 3456'
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上だと登録できない' do
        @purchase_card.telephone_number = 12_132_345_554_765
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が9桁以下だと登録できない' do
        @purchase_card.telephone_number = 12_132_345_5
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'トークンが空だと登録できない' do
        @purchase_card.token = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'user_idが空だと登録できない' do
        @purchase_card.user_id = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと登録できない' do
        @purchase_card.item_id = nil
        @purchase_card.valid?
        expect(@purchase_card.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end