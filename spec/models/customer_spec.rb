require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
  end

  describe '顧客情報の登録' do
    context '顧客情報を登録できるとき' do
      it 'nameが存在すれば登録できる' do
        expect(@customer).to be_valid
      end
    end

    context '顧客情報を登録できないとき' do
      it 'nameが空では登録できない' do
        @customer.name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end      