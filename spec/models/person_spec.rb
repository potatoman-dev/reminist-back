require "rails_helper"

RSpec.describe Person, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validation" do
    let(:user) { FactoryBot.build(:user) }

    it "ヒトを正常に作成できる" do
      person = FactoryBot.build(:person, user: user)
      expect(person).to be_valid
      expect(person.errors).to be_empty
    end

    it "ヒトの作成に失敗する（名前が空欄）" do
      person = FactoryBot.build(:person, user: user, name: nil)
      expect(person).to be_invalid
      expect(person.errors[:name]).to include("を入力してください")
    end

    it "ヒトの作成に失敗する（名前が100文字より長い）" do
      long_name = "あ" * 101
      person = FactoryBot.build(:person, user: user, name: long_name)
      expect(person).to be_invalid
      expect(person.errors[:name]).to include("は100文字以内で入力してください")
    end
  end
end
