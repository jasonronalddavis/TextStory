class CreateCommentCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_categories do |t|
      t.integer :story_text_id 
      t.integer :comment_id
      t.timestamps
  end
  end
end
