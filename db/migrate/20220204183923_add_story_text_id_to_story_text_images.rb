class AddStoryTextIdToStoryTextImages < ActiveRecord::Migration[6.1]
  def change
    add_column :story_text_images, :story_text_id, :integer
  end
end
