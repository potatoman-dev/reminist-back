require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    it "ユーザーを正常に作成できる" do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it "ユーザーの作成に失敗する（名前が空欄）" do
      user = build(:user, name: "")
      expect(user).to be_invalid
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "ユーザーの作成に失敗する（名前が100文字より長い）" do
      long_name = "あ" * 101
      user = build(:user, name: long_name)
      expect(user).to be_invalid
      expect(user.errors[:name]).to include("は100文字以内で入力してください")
    end

    it "ユーザーの作成に失敗する（メールが空欄）" do
      user = build(:user, email: "")
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "ユーザーの作成に失敗する（パスワードが空欄）" do
      user = build(:user, password: "")
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "ユーザーの作成に失敗する（パスワードが8文字より短い）" do
      user = build(:user, password: "passwor")
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end

    it "ユーザーの作成に失敗する（パスワード確認が空欄）" do
      user = build(:user, password_confirmation: "")
      expect(user).to be_invalid
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "ユーザーの作成に失敗する（パスワードとパスワード確認が不一致）" do
      user = build(:user, password: "password", password_confirmation: "diffrent_password")
      expect(user).to be_invalid
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
  end
end
