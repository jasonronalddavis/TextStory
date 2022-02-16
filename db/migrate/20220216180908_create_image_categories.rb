class CreateImageCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :image_categories do |t|
      t.integer :story_text_id
      t.integer :category_id
      t.integer :image_id

      t.timestamps
    end
  end
end
