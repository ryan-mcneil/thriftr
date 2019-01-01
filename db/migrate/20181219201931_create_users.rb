class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :phone_number, limit: 8
      t.string :ynab_budget_id
      t.boolean :verified, default: false
      t.boolean :notifications, default: true
      t.timestamps
    end
  end
end
