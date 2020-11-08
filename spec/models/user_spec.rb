require 'rails_helper'

  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全部の項目が存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailは、@を含む必要があること" do
          @user.email = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordが5文字以下だと登録できない" do
          @user.password = "aaa00"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが英語のみでは登録できないこと" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordが数字のみでは登録できないこと" do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordとpassword_confirmationが同じでないと登録できない" do
          @user.password = "aaa123"
          @user.password_confirmation = "bbb123"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end 

        it "first_nameは、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
          @user.first_name = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
        end 

        it "last_nameは、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
          @user.last_name = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
        end 

        it "first_nameが空の時は登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid. Input full-width characters.")
        end
        
        it "last_nameが空の時は登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters.")
        end 

        it "first_name_kanaは、全角（カタカナ）での入力がないと登録できない" do
          @user.first_name_kana = "あああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
        end

        it "last_name_kanaは、全角（カタカナ）での入力がされてないと登録できない" do
          @user.last_name_kana = "あああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
        end

        it "first_name_kanaが空の時は登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid. Input full-width katakana characters.")
        end
        
        it "last_name_kanaが空の時は登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid. Input full-width katakana characters.")
        end 

        it "生年月日が必須であること" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end

      end
    end  
  end


  


