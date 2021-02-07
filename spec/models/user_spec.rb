require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "nickname, email, password, password_confirmation, first_name_kanji, last_name_kanji, first_name_kana, last_name_kana が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nicknameが9文字以上では登録できない' do
        @user.nickname = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 8 characters)")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がなければ登録できない' do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailが重複していれば登録できない' do
        @user.save
        anothr_user = FactoryBot.build(:user)
        anothr_user.email = @user.email
        anothr_user.valid?
        expect(anothr_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji Full-width characters")
      end
      it 'first_name_kanjiが全角でないと登録できない' do
        @user.first_name_kanji = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji Full-width characters")
      end
      it 'last_name_kanjiが空では登録できない' do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji Full-width characters")
      end
      it 'last_name_kanjiが全角でないと登録できない' do
        @user.last_name_kanji = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji Full-width characters")
      end
      it 'firse_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it 'firse_name_kanaが全角のカタカナでないと登録できない' do
        @user.first_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it 'last_name_kanaが全角のカタカナでないと登録できない' do
        @user.last_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
    end

  end
end
