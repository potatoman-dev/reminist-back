require "rails_helper"

RSpec.describe Person, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validation" do
    let(:user) { build(:user) }

    it "ヒトを正常に作成できる" do
      person = build(:person, user: user)
      expect(person).to be_valid
      expect(person.errors).to be_empty
    end

    it "ヒトの作成に失敗する（名前が空欄）" do
      person = build(:person, user: user, name: nil)
      expect(person).to be_invalid
      expect(person.errors[:name]).to include("を入力してください")
    end

    it "ヒトの作成に失敗する（名前が100文字より長い）" do
      long_name = "あ" * 101
      person = build(:person, user: user, name: long_name)
      expect(person).to be_invalid
      expect(person.errors[:name]).to include("は100文字以内で入力してください")
    end
  end

  describe "update" do
    let(:user) { build(:user) }
    let(:person) { build(:person, user: user) }

    it "ヒトを正常に編集できる" do
      person.update(name: "ヒトノスケ_updated")
      expect(person).to be_valid
      expect(person.errors).to be_empty
    end

    it "ヒトの編集に失敗する" do
      person.update(name: "")
      expect(person).to be_invalid
      expect(person.errors[:name]).to include("を入力してください")
    end
  end
end
