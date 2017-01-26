class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :name, null: true
      t.timestamps
    end
  end
end
