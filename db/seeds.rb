User.create!(name: "alx",
    email: "al-m@list.ru",
    password: "111111",
    password_confirmation: "111111")

99.times do |n|
    name = Faker::Name.name
    email = "#{n+1}@mail.ru"
    password = "111111"
    User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

User.create!(name: "admin",
    email: "admin@admin.ru",
    password: "111111",
    password_confirmation: "111111",   
    admin: true)

 users = User.order(:created_at).take(6)
    50.times do
        content = Faker::Lorem.sentence(word_count: 5)
        users.each { |user| user.microposts.create!(content: content) }
    end