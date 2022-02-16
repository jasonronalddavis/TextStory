class CreateStoryTextComments < ActiveRecord::Migration[6.1]
  def change
    create_table :story_text_comments do |t|
      t.integer :story_text_id 
      t.integer :comment_id
      t.timestamps
  end
end
end

