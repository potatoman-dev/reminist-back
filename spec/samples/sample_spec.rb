require 'rails_helper'

RSpec.describe "Sample Test" do
  # 成功するテスト
  it "returns the sum of 2 and 3 as 5" do
    result = 2 + 3
    expect(result).to eq(5)
  end

  # エラーが発生するテスト
  it "fails because the sum of 2 and 3 is not 6" do
    result = 2 + 3
    expect(result).to eq(6)
  end
end