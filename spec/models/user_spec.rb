require 'rails_helper'
RSpec.describe User, type: :model do
  it "ユーザーは、name,email,passwordがあれば有効な状態。" do
    user = User.new(
      name: "sample",
      email: "sample@sample.com",
      password: "password"
      )
    expect(user).to be_valid
  end

  it "名前がなければ無効な状態である。" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  # 重複したメールアドレスなら無効な状態であること
  it "重複したメールアドレスなら無効な状態であること" do
    user.create(
      name: "sample",
      email: "sample@sample.com",
      password: "password"
      )
    user = User.new(
      name: "sample",
      email: "sample@sample.com",
      password: "password"
      )
  end
  # ユーザーのフルネームを文字列として返すこと
  it "returns a user's full name as a string"
end