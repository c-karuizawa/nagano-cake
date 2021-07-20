# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
     email: "aa@aa",
     password: "aaaaaa"
  )
  
Customer.create!(
     last_name:  "山田",
     first_name: "花子",
     last_name_kana: "ヤマダ",
     first_name_kana: "ハナコ",
     postal_code: "1234567",
     address: "スカイツリー",
     phone_number: "09012345678",
     email: "hanako@email",
     password: "foobar",
     password_confirmation: "foobar"
 )
  
Order.create!(
     customer_id: 1,
     total_price: 900,
     payment: 0,
     order_status: 0,
     postage: 800,
     name: "aa333",
     postal_code: "3333333",
     address: "qqq",
 )
 
 OrderItem.create!(
      item_id: 1,
      order_id: 1,
      quantity: 2,
      product_status: 0,
      taxin_price: 100
      )
