class CreateLocalities < ActiveRecord::Migration[7.0]
  def change
    create_table :localities do |t|
      t.string :name, null: false
      t.string :province, null: false
      t.index [:name, :province], unique: true
      t.timestamps
    end
  end
end
