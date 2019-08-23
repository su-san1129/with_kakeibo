# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = create(:user)
    @category = Category.create(category: '食費', user_id: @user.id)
  end
  # create_table "variable_costs", force: :cascade do |t|
  # t.integer "user_id"
  # t.integer "category_id"
  # t.integer "price"
  # t.text "opinion"
  # t.text "cost_image_id"
  # t.datetime "payment_day"
  # t.string "address"
  # t.float "latitude"
  # t.float "longitude"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.index ["category_id"], name: "index_variable_costs_on_category_id"
  # t.index ["user_id"], name: "index_variable_costs_on_user_id"

  context 'バリデーション' do
    it 'user_idが存在しなければ投稿できない。' do
      @variable_cost = VariableCost.new(
        price: 500,
        category_id: @category.id,
        opinion: '初投稿',
        user_id: ''
      )
      @variable_cost.save
      expect(@variable_cost.valid?).to eq(false)
    end

    it 'category_idが存在しなければ投稿できない' do
      @variable_cost = VariableCost.new(
        price: 500,
        category_id: '',
        opinion: '初投稿',
        user_id: @user.id
      )
      @variable_cost.save
      expect(@variable_cost.valid?).to eq(false)
    end

    it 'priceが存在しなければ投稿できない' do
      @variable_cost = VariableCost.new(
        price: '',
        category_id: @category.id,
        opinion: '初投稿',
        user_id: @user.id
      )
      @variable_cost.save
      expect(@variable_cost.valid?).to eq(false)
    end

    it 'price,category_id,user_idが存在すれば投稿できる' do
      @variable_cost = VariableCost.new(
        price: 3000,
        category_id: @category.id,
        opinion: '初投稿',
        user_id: @user.id
      )
      @variable_cost.save
      expect(@variable_cost.valid?).to eq(true)
    end
  end
end
