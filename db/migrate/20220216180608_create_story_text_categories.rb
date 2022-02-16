class CreateStoryTextCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :story_text_categories do |t|
      t.integer :story_text_id
      t.integer :category_id
   
      t.timestamps
    end
  end
end
