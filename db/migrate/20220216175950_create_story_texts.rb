class CreateStoryTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :story_texts do |t|
      t.float :score
      t.integer :dislike
      t.integer :like
      t.string :description
      t.string :name

      t.timestamps
    end
  end
end
