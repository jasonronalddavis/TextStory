class StoryTextSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :comments, :categories, :text_content, :images


  has_many :user_story_texts
  has_many :users, through: :user_story_texts
  has_many :story_text_categories
  has_many :categories, through: :story_text_categories
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :user_comments
  has_many :comments, through: :user_comments 
  has_many :story_text_comments
  has_many :comments, through: :story_text_comments 
  has_many :story_text_images
  has_many :images, through: :story_text_images 




end
