require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の登録' do
    context '商品情報を登録できるとき' do
      it 'nameとpurchase_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報を登録できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'purchase_priceが空では登録できない' do
        @item.purchase_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Purchase price can't be blank")
      end
    end  
  end
end  