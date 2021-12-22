require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    creator = FactoryBot.create(:creator, user_id: user.id)
    @order = FactoryBot.build(:order, creator_id: creator.id)
    sleep 0.1
  end

  describe 'オーダー新規作成' do
    context '新規作成ができる場合' do
      it 'order_name,order_text,order_price_min,order_price_max,genre_id,day_min,day_max,main_order_image,order_imagesがあれば登録できる' do
        expect(@order).to be_valid
      end
      it 'order_imagesがなくても登録できる' do
        @order.order_images = nil
        expect(@order).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'order_nameがなければ登録できない' do
        @order.order_name = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Order name can't be blank")
      end
      it 'order_textがなければ登録できない' do
        @order.order_text = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Order text can't be blank")
      end
      it 'order_price_minがなければ登録できない' do
        @order.order_price_min = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Order price min can't be blank")
      end
      it 'order_price_minが数値でなければ登録できない' do
        @order.order_price_min = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include("Order price min is out of setting range")
      end
      it 'order_price_maxがなければ登録できない' do
        @order.order_price_max = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Order price max can't be blank")
      end
      it 'order_price_maxが数値でなければ登録できない' do
        @order.order_price_max = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include("Order price max is out of setting range")
      end
      it 'order_price_maxがorder_price_minより値が小さければ登録できない' do
        @order.order_price_min = 10
        @order.order_price_max = 5
        expect(@order.errors.full_messages).to include("Order price max is out of setting range")
      end
      it 'order_genre_idがなければ登録できない' do
        @order.genre_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Genre can't be blank")
      end
      it 'day_minがなければ登録できない' do
        @order.day_min = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Day min can't be blank")
      end
      it 'day_minが数値でなければ登録できない' do
        @order.day_min = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include("Day min is out of setting range")
      end
      it 'day_maxがなければ登録できない' do
        @order.day_max = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Day max can't be blank")
      end
      it 'day_maxが数値でなければ登録できない' do
        @order.day_max = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include("Day max is out of setting range")
      end
      it 'day_maxがday_minより値が小さければ登録できない' do
        @order.day_min = 10
        @order.day_max = 5
        expect(@order.errors.full_messages).to include("Day max is out of setting range")
      end
      it 'main_order_imageがなければ登録できない' do
        @order.main_order_image = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Main order image can't be blank")
      end
    end
  end
end
