class AddStoryTextIdToUserCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :user_categories, :story_text_id, :integer
  end
end
