require "rails_helper"

RSpec.describe Conversation, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { build(:user) }
  let(:person) { build(:person, user: user) }

  it "会話を正常に作成できる" do
    conversation = build(:conversation, person: person)
    expect(conversation).to be_valid
    expect(conversation.errors).to be_empty
  end

  it "会話の作成に失敗する（日付が空欄）" do
    conversation = build(:conversation, person: person, date: nil)
    expect(conversation).to be_invalid
    expect(conversation.errors[:date]).to include("を入力してください")
  end

  it "会話の作成に失敗する（本文が空欄）" do
    conversation = build(:conversation, person: person, body: "")
    expect(conversation).to be_invalid
    expect(conversation.errors[:body]).to include("を入力してください")
  end
end
