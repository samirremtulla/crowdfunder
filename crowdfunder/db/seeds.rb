# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Project.destroy_all

user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "jdoe111")

10.times do |i|
    project1 = user.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}",
        description: "description #{i}", goal: 13000)
end

user2 = User.create!(first_name: "Samir", last_name: "Remtulla", email: "samir@remtulla.com", password: "samir")

5.times do |i|
    project2 = user2.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}",
        description: "description #{i}", goal: 13000)
end
