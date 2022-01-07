require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do

    before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)    
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep (0.5)
    end

    context '購入できるとき' do
      it '値が全て正しければ購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号が空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が空だと購入できない' do
      @order_address.area_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号に全角数字を含むと購入できない' do
        @order_address.postal_code = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号が３桁ハイフン４桁でないと購入できない' do
        @order_address.postal_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '電話番号が全角数字だと購入できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号にハイフンを含むと購入できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が９桁以下だと登録できない' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が1２桁以上だと登録できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'ユーザーが紐付いていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品情報が紐付いていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

    end


  end      
end
