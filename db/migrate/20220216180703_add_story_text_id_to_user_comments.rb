class AddStoryTextIdToUserComments < ActiveRecord::Migration[6.1]
  def change
    add_column :user_comments, :story_text_id, :integer

  end
end
