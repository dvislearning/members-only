class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :subject
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end