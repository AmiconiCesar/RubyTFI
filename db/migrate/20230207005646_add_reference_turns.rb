class AddReferenceTurns < ActiveRecord::Migration[7.0]
  def change
    change_table :turns do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :employee, null: true, foreign_key: { to_table: :users }
    end
  end
end