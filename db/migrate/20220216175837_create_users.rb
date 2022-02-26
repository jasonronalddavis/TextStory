class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.float :total_score
      t.string :name
      t.string :bio
      t.timestamps
    end
  end
end
