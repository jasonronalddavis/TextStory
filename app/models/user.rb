class User < ApplicationRecord
has_secure_password


has_many :user_story_texts
has_many :story_texts, through: :user_story_texts
has_many :user_categories
has_many :categories, through: :user_categories 
has_many :story_text_categories
has_many :categories, through: :story_text_categories
has_many :user_comments
has_many :comments, through: :user_comments 
has_many :story_text_comments 
has_many :comments, through: :story_text_comments 
has_many :user_images 
has_many :images, through: :user_images 


validates :name, uniqueness: true
end
