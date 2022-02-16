class UserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments do |t|
      t.integer :user_id 
      t.integer :comment_id
      t.timestamps
  end
end
end
