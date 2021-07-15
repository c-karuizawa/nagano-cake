# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# メインのサンプルユーザーを1人作成する
Customer.create!(last_name:  "山田",
             first_name: "花子",
             last_name_kana: "ヤマダ",
             first_name_kana: "ハナコ",
             postal_code: "1234567",
             address: "スカイツリー",
             phone_number: "09012345678",
             email: "hanako@email",
             password: "foobar",
             password_confirmation: "foobar")

# # 追加のユーザーをまとめて生成する
# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
# end