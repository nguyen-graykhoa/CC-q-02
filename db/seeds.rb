# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

PASSWORD = "123"
super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    is_admin: true
)

5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD
    )
end

users = User.all

50.times do
    i_f = IdeaFactory.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::ChuckNorris.fact,
        user: users.sample
    )

    if i_f.valid?
        rand(1..5).times do
        Review.create(body: Faker::Hacker.say_something_smart, idea_factory: i_f, user: users.sample)
        end
    end
end

idea_factories = IdeaFactory.all 


puts Cowsay.say("Generated #{users.count} users", :koala)
puts Cowsay.say("Generated #{idea_factories.count} idea_factories", :frogs)