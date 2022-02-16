class AddUserIdToStoryTextCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :story_text_categories, :user_id, :integer
  end
end
