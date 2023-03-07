require 'rails_helper'

RSpec.describe User, type: :model do
    before do
    @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it '全て揃っていれば登録できる' do
        expect(@user).to be_valid
      end

      it '登録にパスワードは、6文字以上での入力が必要である' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end


    context '新規登録出来ない時' do
      it 'ニックネームがないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end

      it 'メールアドレスがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end

      it 'メールアドレスが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email 
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'katou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'yuuta'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it '名字のフリガナが全角（カタカナ）でないと登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it '名前のフリガナが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'ゆうた'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'メールアドレスは、＠を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、半角数字でないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'パスワードは、半角英字でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'パスワードは、全角だと登録できない' do
        @user.password = 'ｗｗｗｗｗｗ'
        @user.password_confirmation = 'ｗｗｗｗｗｗ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'パスワードとパスワード(確認)は、値が一致していないと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it ' 生年月日がないとログインできない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
