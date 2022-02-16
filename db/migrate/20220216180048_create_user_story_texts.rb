class CreateUserStoryTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_story_texts do |t|
      t.integer :user_id 
      t.integer :story_text_id
      t.timestamps
  end
end
end

