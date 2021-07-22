# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "sample@aa",
              password: "aaaaaa")

Customer.create!(last_name:  "山田",
             first_name: "花子",
             last_name_kana: "ヤマダ",
             first_name_kana: "ハナコ",
             postal_code: "1234567",
             address: "東京都渋谷区代々木0-0-0ハナコマンション00号室",
             phone_number: "09012345678",
             email: "hanako@email.com",
             password: "foobar",
             password_confirmation: "foobar")

Customer.create!(last_name:  "鈴木",
             first_name: "一朗",
             last_name_kana: "スズキ",
             first_name_kana: "イチロウ",
             postal_code: "1111111",
             address: "東京都渋谷区代々木1-1-1ハナコマンション11号室",
             phone_number: "09015151515",
             email: "ichiro@email.com",
             password: "foobar",
             password_confirmation: "foobar")


Genre.create!(name: "ケーキ")

Item.create!(genre_id: 1,
             name: "アップルパイ",
             introduction: "季節の長野県産りんごを使用",
             price: 1000)

Item.create!(genre_id: 1,
             name: "アップルジャム",
             introduction: "季節の長野県産りんごを使用",
             price: 500)

Item.create!(genre_id: 1,
             name: "アップルアイス",
             introduction: "季節の長野県産りんごを使用",
             price: 300)
