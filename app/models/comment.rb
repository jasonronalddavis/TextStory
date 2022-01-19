class Comment < ApplicationRecord
    
    has_many :story_text_categories
    has_many :categories, through: :story_text_categories

    has_many :user_categories
    has_many :categories, through: :user_categories

    has_many :user_comments
    has_many :users, through: :user_comments

    has_many :story_text_comments
    has_many :story_texts, through: :story_text_comments 

    has_many :image_comments
    has_many :images, through: :image_comments


end
