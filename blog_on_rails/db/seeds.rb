50.times do
    created_at = Faker::Date.backward(days:365 * 5)

    p = Post.create(
       title: Faker::Company.name,
       body:Faker::Hacker.say_something_smart + "YukihiroMa"*5,
       created_at: created_at,
       updated_at: created_at
    )
    if p.valid? 
        rand(1..5).times do
            Comment.create(body:Faker::Hacker.say_something_smart, post:p)
        end
    end

end

posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{posts.count} posts", :turtle)
puts Cowsay.say("Generated #{comments.count} comments", :sheep)
