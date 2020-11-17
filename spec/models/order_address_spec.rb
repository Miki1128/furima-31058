require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
   before do
    @order_address = FactoryBot.build(:order_address)
  end
  
  context '商品購入がうまくいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it '建物名が空でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do
    it '配送先の情報として、郵便番号がないと登録できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end

    it '郵便番号にハイフンがないと登録できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '配送先の情報として、都道府県がないと登録できない' do 
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '配送先の情報として、都道府県が---だと登録できない' do 
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it '配送先の情報として、市町村がないと登録できない' do 
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '配送先の情報として、番地がないと登録できない' do 
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '配送先の情報として、電話番号がないと登録できない' do 
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end

    it '電話番号にはハイフンがると登録できない' do
      @order_address.phone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は11桁以内でないと登録できない' do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'tokenが入力されてないと登録できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
