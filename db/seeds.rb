# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
30.times do |n|
  User.create(email: "sample#{n}@gmail.com",
             username: "sample#{n}",
             password: "password",
             password_confirmation: "password")
end

10.times do |user_id|
  10.times do |day|
    Schedule.create(title: "予定なし",
                   user_id: user_id,
                   prefecture: "福岡県",
                   start: DateTime.new(2018, 10, day+1))
  end
end

Group.create(url: "https://www.hotpepper.jp/strJ000026200/",
             start: DateTime.tomorrow,
             prefecture: "福岡県",
             store_name: "本格地鶏料理　居酒屋　もりもり",
             location: "福岡県福岡市博多区博多駅東１－1－３３はかた近代ビルB1F")
