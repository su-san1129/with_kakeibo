require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @user = build(:user)
    end

    context "バリデーション" do

    it "ユーザーは、name,email,passwordがあれば有効な状態。" do
      expect(@user.valid?).to eq(true)
    end

    it "名前がなければ無効な状態である。" do
      @user.name = ""
      expect(@user.valid?).to eq(false)
    end

    it "emailがなければ無効な状態である。" do
      @user.email = ""
      expect(@user.valid?).to eq(false)
    end

    it "名前は2文字以上である。" do
      @user.name = "a"
      expect(@user.valid?).to eq(false)
    end

    it "名前は50文字以内である。" do
      @user.name = "aaaa"*15
      expect(@user.valid?).to eq(false)
    end

    it "自己紹介(introduction)は50文字以内である。" do
      @user.introduction = "aaaa"*15
      expect(@user.valid?).to eq(false)
    end

    it "emailは正規表現にマッチするか" do
      @user.email = "aaa@a.a.a"
      expect(@user.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end

  end
end