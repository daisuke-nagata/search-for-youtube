class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :url
      t.references :user, foreign_key: true
      t.string :youtuber_name

      t.timestamps
    end
  end
end
