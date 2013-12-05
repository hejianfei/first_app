class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.integer :mobile
      t.integer :admin
      t.string :ip

      t.timestamps
    end
  end
end
