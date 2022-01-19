class AddTextContentToStoryText < ActiveRecord::Migration[6.1]
  def change
    add_column :story_texts, :text_content, :string

  end
end
