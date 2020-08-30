require 'rails_helper'

RSpec.describe BuyerReceiver, type: :model do
  describe '購入情報の保存' do
    before do
      @buyer_receiver = FactoryBot.build(:buyer_receiver)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@buyer_receiver).to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @buyer_receiver.token = nil
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では登録できないこと' do
      @buyer_receiver.postal_code = nil
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'prefecture_idが「1」では登録できないこと' do
      @buyer_receiver.prefecture_id = 1
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空では登録できないこと' do
      @buyer_receiver.city = nil
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空では登録できないこと' do
      @buyer_receiver.house_number = nil
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空では登録できないこと' do
      @buyer_receiver.phone_number = nil
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'building_nameは空であっても登録できること' do
      @buyer_receiver.building_name = nil
      expect(@buyer_receiver).to be_valid
    end


    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
      @buyer_receiver.postal_code = '1234567'
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("Postal code input correctly")
    end

    it 'phone_numberが全角だと登録できないこと' do
      @buyer_receiver.phone_number = '０９０１２３４５６７８'
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("Phone number Half-width number")
    end

    it 'phone_numberがハイフンを含むと登録できないこと' do
      @buyer_receiver.phone_number = '090-1234567'
      @buyer_receiver.valid?
      expect(@buyer_receiver.errors.full_messages).to include("Phone number Half-width number")
    end

  end
end
