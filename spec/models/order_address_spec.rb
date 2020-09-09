require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '購入情報の保存' do
    context '購入情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end

      it 'buildは空でも登録できること' do
        @order.build = nil
        expect(@order).to be_valid
      end

      it 'phone_numberが11桁以内なら保存できること' do
        @order.phone_number = '09012341234'
        expect(@order).to be_valid
      end
    end
    context '購入情報の保存ができないとき' do
      it 'tokenが空だと登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと登録できないこと' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは[-]を含めて[3桁-4桁]の半角数字でないと登録できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'region_idが0(---)だと登録できないこと' do
        @order.region_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Region can't be blank")
      end

      it 'cityが空だと登録できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと登録できないこと' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以内ではないと登録できない' do
        @order.phone_number = '090123412341'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
