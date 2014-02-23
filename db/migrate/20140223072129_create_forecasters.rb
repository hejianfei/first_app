class CreateForecasters < ActiveRecord::Migration
  def change
    create_table :forecasters do |t|
      t.integer :user_id
      t.string :name
      t.string :mobile
      t.string :qq
      t.integer :state

      t.timestamps
    end
  end
end
