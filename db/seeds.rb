 Category.destroy_all


 User.destroy_all

 StoryText.destroy_all

 Comment.destroy_all


 user1 = User.create(:name => "Guest", :password => "muh")

 user2 = User.create(:name => "JD", :password => "barnes")

 user3 = User.create(:name => "Barnes", :password => "barnes")








 pilot = Category.create(name: "pilot/Script")

 comic = Category.create(name: "Graphic Novel/ Comic")

 plain_text = Category.create(name: "plain Text")

 poem = Category.create(name: "poem")









 story = StoryText.create(name: "A message To My Future Son", description: "Well...So you do exist. Words of wisodom, be wary of your actions.")



 comment = Comment.create(name: "comment", description: "mughhh!" )


user = User.find_by_name("Guest")

pilot = Category.find_by_name("pilot/Script")

story = StoryText.find_by_name("A message To My Future Son")





user.story_texts << story





user3.story_texts << story




story.comments << comment



user3.story_texts << story