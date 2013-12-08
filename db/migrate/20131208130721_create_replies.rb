class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :topic_id
      t.text :content
      t.integer :user_id
      t.integer :is_valid
      t.integer :top

      t.timestamps
    end
  end
end
