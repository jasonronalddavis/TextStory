class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :url
      t.string :name
      t.string :description
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
