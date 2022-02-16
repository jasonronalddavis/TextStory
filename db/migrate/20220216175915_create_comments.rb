class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :dislike
      t.integer :like
      t.string :name

      t.timestamps
    end
  end
end
