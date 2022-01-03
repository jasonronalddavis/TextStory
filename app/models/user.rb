class User < ApplicationRecord
has_secure_password
has_secure_password :recovery_password, validations: false



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

validates :username, uniqueness: true
end
