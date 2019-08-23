# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_618_061_313) do
  create_table 'categories', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'category'
    t.integer 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_categories_on_user_id'
  end

  create_table 'cost_comments', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'variable_cost_id'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_cost_comments_on_user_id'
    t.index ['variable_cost_id'], name: 'index_cost_comments_on_variable_cost_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'variable_cost_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_favorites_on_user_id'
    t.index ['variable_cost_id'], name: 'index_favorites_on_variable_cost_id'
  end

  create_table 'fixed_costs', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'fixed_cost_name'
    t.integer 'fixed_cost_price'
    t.datetime 'fixed_cost_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_fixed_costs_on_user_id'
  end

  create_table 'incomes', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'payday'
    t.integer 'income'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_incomes_on_user_id'
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'following_id'
    t.integer 'follower_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'introduction'
    t.text 'profile_image_id'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'variable_costs', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'category_id'
    t.integer 'price'
    t.text 'opinion'
    t.text 'cost_image_id'
    t.datetime 'payment_day'
    t.string 'address'
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_variable_costs_on_category_id'
    t.index ['user_id'], name: 'index_variable_costs_on_user_id'
  end
end
