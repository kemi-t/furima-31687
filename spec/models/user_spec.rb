require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "以下が存在すれば登録ができる
          nickname、email、password、password_confirmation、
          first_name、last_name、first_name_kana、last_name_kana、birthday" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上あれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
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
      it "emailに＠が含まれていないと登録できない" do
        @user.email = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        next_user = FactoryBot.build(:user)
        next_user.email = @user.email
        next_user.valid?
        expect(next_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英数字混合でないと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword-confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 漢字、ひらがな、カタカナのいずれかを使用してください")
      end
      it "first_nameは半角及び全角ひらがな、漢字以外では登録できない" do
        @user.first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.first_name = "1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.first_name = "ａａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.first_name = "１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.first_name = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.first_name = "@!-"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナのいずれかを使用してください")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 漢字、ひらがな、カタカナのいずれかを使用してください")
      end
      it "last_nameは全角ひらがな、漢字以外では登録できない" do
        @user.last_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.last_name = "1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.last_name = "ａａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.last_name = "１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.last_name = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナのいずれかを使用してください")
        @user.last_name = "@!-"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナのいずれかを使用してください")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カナを使用してください")
      end
      it "first_name_kanaは全角カタカナ以外では登録できない" do
        @user.first_name_kana = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        @user.first_name_kana = "1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        @user.first_name_kana = "ａａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        @user.first_name_kana = "１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        @user.first_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        @user.first_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        @user.first_name_kana = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        @user.first_name_kana = "@!-"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カナを使用してください")
      end
      it "last_name_kanaは全角カタカナ以外では登録できない" do
        @user.last_name_kana = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        @user.last_name_kana = "1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        @user.last_name_kana = "ａａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        @user.last_name_kana = "１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        @user.last_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        @user.last_name_kana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        @user.last_name_kana = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        @user.last_name_kana = "@!-"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
