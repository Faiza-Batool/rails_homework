Post.destroy_all
Comment.destroy_all
User.destroy_all

PASSWORD = '123'

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    is_admin: true
)

10.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name:first_name,
        last_name: last_name,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD
        
    )
end

users = User.all

50.times do
    created_at = Faker::Date.backward(days:365 * 5)

    p = Post.create(
       title: Faker::Company.name,
       body:Faker::Hacker.say_something_smart + "YukihiroMa"*5,
       created_at: created_at,
       updated_at: created_at,
       user: users.sample
    )
    if p.valid? 
        rand(1..5).times do
            Comment.create(body:Faker::Hacker.say_something_smart, post:p, user: users.sample)
        end
    end

end

posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{posts.count} posts", :turtle)
puts Cowsay.say("Generated #{comments.count} comments", :sheep)
puts Cowsay.say("Generated #{users.count} users", :koala)
