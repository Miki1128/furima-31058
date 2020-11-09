require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end

  describe "商品出品機能" do
    context "商品出品がうまくいくとき" do
      it "全部の項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
  
    context "商品出品がうまくいかないとき" do
      it "商品画像がないと登録できない" do 
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include( "Image can't be blank",)
      end 
      
      it"商品名がないと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( "Name can't be blank",)
      end

      it"カテゴリーを選択していないと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( "Category can't be blank",)
      end
      
      it"商品状態を選択していないと登録できない" do 
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( "Status can't be blank",)
      end

      it"配送料負担を選択していないと登録できない"do
        @item.shipping_cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( "Shipping cost can't be blank",)
      end
      
      it"発送元地域を選択していないと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( "Prefecture can't be blank",) 
      end

      it"発送までの日数を選択していないと登録できない" do 
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( "Shipping day can't be blank",)
      end

      it"販売価格を入力していないと登録できない" do 
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price can't be blank",)
      end
      
      it"販売価格が¥300以下だと販売できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it"販売価格が¥9,999,999以上だと販売できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it"販売価格が半角英数字ではないと販売できない" do
       @item.price = "１０００"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it"---を選択すると登録できない" do
       @item.category_id = "---"
       @item.valid?
       expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it"---を選択すると登録できない" do
        @item.status_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
       end

       it"---を選択すると登録できない" do
        @item.shipping_cost_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
       end
 
       it"---を選択すると登録できない" do
        @item.prefecture_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
       end
       
       it"---を選択すると登録できない" do
        @item.shipping_day_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
       end
    end
  end
end
