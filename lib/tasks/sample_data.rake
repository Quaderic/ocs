namespace :db do
desc "Fill database with sample data"
task populate: :environment do
admin = User.create!(first_name: "Erik",last_name: "Kuada",
email: "erickuada@yahoo.com",
password: "foobar",
password_confirmation: "foobar")
admin.toggle!(:admin)

99.times do |n|
name = Faker::Name.name
lastname ="McMagic-#{n+1}"
email = "example-#{n+1}@classysol.com"
password = "password"
User.create!(first_name: name,
last_name: lastname,
email: email,
password: password,
password_confirmation: password)
end
end
end
