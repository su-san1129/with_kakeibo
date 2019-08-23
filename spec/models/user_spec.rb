# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  # context 'アソシエーション' do
  #   it "variable_costモデルを多数持っている" do
  #     is_expected.to have_many(:variable_costs)
  #   end

  #   it "incomeモデルを多数持っている" do
  #     is_expected.to have_many(:incomes)
  #   end

  #   it "cost_commentモデルを持っている" do
  #     is_expected.to have_many(:cost_comments)
  #   end

  #   it "active_relationshipsを多数持っている" do
  #     is_expected.to have_many(:active_relationships)
  #   end

  #   it "passive_relationshipsを多数持っている" do
  #     is_expected.to have_many(:passive_relationships)
  #   end

  #   it "followingsを多数持っている" do
  #     is_expected.to have_many(:followings)
  #   end

  #   it "followersを多数持っている" do
  #     is_expected.to have_many(:followers)
  #   end

  #   it "favoriteモデルを多数持っている" do
  #     is_expected.to have_many(:favorites)
  #   end

  #   it "fixed_costモデルを多数持っている" do
  #     is_expected.to has_many(:fixed_costs)
  #   end

  #    it "categoryモデルを持っている" do
  #     is_expected.to have_many(:categories)
  #   end
  # end

  context 'バリデーション' do
    it 'ユーザーは、name,email,passwordがあれば有効な状態。' do
      expect(@user.valid?).to eq(true)
    end

    it '名前がなければ無効な状態である。' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailがなければ無効な状態である。' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it '名前は2文字以上である。' do
      @user.name = 'a'
      expect(@user.valid?).to eq(false)
    end

    it '名前は50文字以内である。' do
      @user.name = 'aaaa' * 15
      expect(@user.valid?).to eq(false)
    end

    it '自己紹介(introduction)は50文字以内である。' do
      @user.introduction = 'aaaa' * 15
      expect(@user.valid?).to eq(false)
    end

    it 'emailは正規表現にマッチするか' do
      @user.email = 'aaa@a.a.a'
      expect(@user.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end
  end
end
