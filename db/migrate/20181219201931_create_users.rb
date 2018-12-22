class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :phone_number
      t.string :ynab_token
      t.boolean :verified, default: false
      t.boolean :notifications, default: true
      t.timestamps
    end
  end
end
