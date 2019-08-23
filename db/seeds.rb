# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(
  name: 'sample太郎',
  introduction: 'サンプルです。家計簿頑張ります。',
  password: 'password',
  email: 'sample@sample.com'
)

Category.create(category: '食費', user_id: user1.id, status: 1)
Category.create(category: '交通費', user_id: user1.id, status: 1)
Category.create(category: '通信費', user_id: user1.id, status: 1)
Category.create(category: '交際費', user_id: user1.id, status: 1)
Category.create(category: '教育費', user_id: user1.id, status: 1)
Category.create(category: '医療費', user_id: user1.id, status: 1)
