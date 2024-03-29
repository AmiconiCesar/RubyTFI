class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :role, default: 1, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
