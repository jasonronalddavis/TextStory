class AddStatusToStoryTexts < ActiveRecord::Migration[6.1]
  def change
    add_column :story_texts, :status, :boolean
  end
end
