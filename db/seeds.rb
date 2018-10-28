# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
60.times do |n|
  User.create(email: "sample#{n}@gmail.com",
              username: Gimei.kanji,
             password: "password",
             password_confirmation: "password")
end

10.times do |user_id|
  3.times do |day|
    Schedule.create(title: "予定なし",
                   user_id: user_id,
                   prefecture: "福岡県",
                   start: DateTime.new(2018, 10, (day+1) * (day + 3)))
  end
end

Group.create(url: "https://www.hotpepper.jp/strJ000026200/",
             start: DateTime.new(2018, 10, 1),
             prefecture: "福岡県",
             store_name: "本格地鶏料理　居酒屋　もりもり",
             book: true,
             location: "福岡県福岡市博多区博多駅東１－1－３３はかた近代ビルB1F")

Group.last.users << User.first
Group.last.users << User.second
Group.last.users << User.third
Group.last.users << User.find(4)

3.times do |n| 
  Group.create(start: DateTime.new(2018, 10, (n+1)*5),
               prefecture: "福岡県") 
Group.last.users << User.first
Group.last.users << User.find(9)
Group.last.users << User.find(15)
Group.last.users << User.find(4)
end
5.times do |n| 
  Group.create(start: DateTime.new(2018, 10, (n * 5)+2),
               prefecture: "福岡県") 
Group.last.users << User.first
Group.last.users << User.find(53)
Group.last.users << User.find(45)
Group.last.users << User.find(4)
end
