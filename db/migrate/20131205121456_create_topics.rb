class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :category_id
      t.integer :feedback
      t.integer :state
      t.integer :views
      t.integer :replies
      t.integer :top
      t.integer :essence

      t.timestamps
    end
  end
end
