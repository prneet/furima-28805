require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
      it "nameとemail、passwordとpassword_confirmation、本人確認情報が存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "passwordが英数字６文字以上であれば登録できる" do
        @user.password = "aaa333"
        @user.password_confirmation = "aaa333"
        expect(@user).to be_valid
      end
      it "first_nameが全角文字であれば登録できる" do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it "last_nameが全角文字であれば登録できる" do
        @user.last_name = "太朗"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カナであれば登録できる" do
        @user.first_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カナであれば登録できる" do
        @user.last_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it "nameが空では登録できないこと" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが５文字以下だと登録できないこと" do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "first_nameが空だと登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaが空だと登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空だと登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_nameが英数字だと登録できないこと" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用して下さい")
      end
      it "last_nameが英数字だと登録できないこと" do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用して下さい")
      end
      it "first_name_kanaが全角カナでないと登録できないこと" do
        @user.first_name_kana = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用して下さい")
      end
      it "last_name_kanaが全角カナでないと登録できないこと" do
        @user.last_name_kana = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用して下さい")
      end
    end
  end
end