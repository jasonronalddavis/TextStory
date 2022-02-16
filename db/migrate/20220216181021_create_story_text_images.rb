class CreateStoryTextImages < ActiveRecord::Migration[6.1]
  def change
    create_table :story_text_images do |t|
      t.integer :story_id
      t.integer :image_id

      t.timestamps
    end
  end
end