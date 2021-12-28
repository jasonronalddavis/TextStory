class UserStoryText < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :category, optional: true
    belongs_to :story_text, optional: true
    belongs_to :comment, optional: true
end