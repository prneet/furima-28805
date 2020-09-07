require 'rails_helper'

RSpec.describe Item, type: :model do
  before '#create' do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品の出品' do
    context '商品が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字で300以上なら保存できること' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが半角数字で9,999,999以下なら保存できること' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品が保存できないとき' do
      it 'nameが空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'textが空だと保存できないこと' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが10,000,000以上だと保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが全角数字だと保存できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'status_idの値が[0(---)]だと保存できないこと' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'genre_idの値が[0(---)]だと保存できないこと' do
        @item.genre_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'postage_idの値が[0(---)]だと保存できないこと' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'region_idの値が[0(---)]だと保存できないこと' do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'post_day_idの値が[0(---)]だと保存できないこと' do
        @item.post_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Post day can't be blank")
      end
    end
  end
end
