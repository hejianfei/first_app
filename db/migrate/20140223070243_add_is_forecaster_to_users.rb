class AddIsForecasterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_forecaster, :integer, :default => -1
  end
end
