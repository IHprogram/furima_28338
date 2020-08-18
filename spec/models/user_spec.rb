require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、email、password、password_confirmation、first_name、family_name、first_name_furigana、family_name_furigana、birth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_name_furiganaが空では登録できないこと' do
      @user.first_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end

    it 'family_name_furiganaが空では登録できないこと' do
      @user.family_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
    end

    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it '重複したnicknameが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, nickname: @user.nickname)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12345'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英字のみなら保存できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが数字のみなら保存できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'first_nameが全角なら保存できる' do
      @user.first_name = '全角'
      expect(@user).to be_valid
    end

    it 'first_nameが全角ではないなら保存できない' do
      @user.first_name = 'first'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'family_nameが全角なら保存できる' do
      @user.family_name = '全角'
      expect(@user).to be_valid
    end

    it 'family_nameが全角ではないなら保存できない' do
      @user.family_name = 'family'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name Full-width characters')
    end

    it 'first_name_furiganaがカタカナなら保存できる' do
      @user.first_name_furigana = 'カタカナ'
      expect(@user).to be_valid
    end

    it 'first_name_furiganaがカタカナではないなら保存できない' do
      @user.first_name_furigana = '全角'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furigana Full-width katakana characters')
    end

    it 'family_name_furiganaがカタカナなら保存できる' do
      @user.family_name_furigana = 'カタカナ'
      expect(@user).to be_valid
    end

    it 'family_name_furiganaがカタカナではないなら保存できない' do
      @user.family_name_furigana = '全角'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name furigana Full-width katakana characters')
    end
  end
end
