 Category.destroy_all


 User.destroy_all

 StoryText.destroy_all

 Comment.destroy_all


 user1 = User.create(:name => "Guest", :password => "muh")


 user2 = User.create(:name => "JD", :password => "barnes")

 user3 = User.create(:name => "Barnes", :password => "barnes")








 comedy = Category.create(name: "Comedy")

 thriller = Category.create(name: "Thriller")

sciFi = Category.create(name: "SCI Fi")

 romance = Category.create(name: "Romance")

 horror = Category.create(name: "Horror")

 drama = Category.create(name: "Drama")

 action = Category.create(name: "Action")









story = StoryText.create(name: "Something Corny", description: " Shoert story about romance stuff.")
story_2 = StoryText.create(name: "Something thrilling", description: "Short story about thrilling stuff.")
story_3 = StoryText.create(name: "Something Funny", description: "Short story about funny stuff.")
story_4 = StoryText.create(name: "Something Scary", description: "Short story about scary stuff.")


comment = Comment.create(name: "user_comment", description: "mughhh!" )
comment2 = Comment.create(name: "user_comment", description: "LMAO!" )

comment3 = Comment.create(name: "user_comment", description: "Im scared" )



comedy = Category.find_by_name("Comedy")

something_corny = StoryText.find_by_name("Something Corny")

user = User.find_by_name("Guest")

user1.story_texts << story
user2.story_texts << story_3
user3.story_texts << story_2
user2.story_texts << story_4
story_4.categories << horror
story_3.categories << comedy
story.categories << romance
something_corny.comments << comment
story_3.comments << comment2
story_4.comments << comment3
