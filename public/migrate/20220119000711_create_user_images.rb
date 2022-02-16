class CreateUserImages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_images do |t|
      t.integer :user_id
      t.integer :image_id
      t.integer :story_text_id

      t.timestamps
    end
  end
end
