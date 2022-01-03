class AddUserIdToStoryTextComments < ActiveRecord::Migration[6.1]
  def change
    add_column :story_text_comments, :user_id, :integer

  end
end
