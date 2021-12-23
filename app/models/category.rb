class Category < ApplicationRecord


    has_many :user_categories
    has_many :users, through: :user_categories


    has_many :story_text_categories
    has_many :story_texts, through: :story_text_categories

    has_many :user_story_texts
    has_many :story_texts, through: :user_story_texts
    has_many :users, through: :user_story_texts


   
   
end
