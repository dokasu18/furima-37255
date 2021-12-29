require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '商品情報が正しければ出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it '商品のカテゴリーが---では保存できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が---では保存できない' do
        @item.condition_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が---では保存できない' do
        @item.cost_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it '発送元の地域が---では保存できない' do
        @item.area_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数が---では保存できない' do
        @item.shipping_date_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300以下では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が¥9,999,999以上では保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'ユーザーが紐づいていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
