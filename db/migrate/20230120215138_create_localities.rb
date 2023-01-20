class CreateLocalities < ActiveRecord::Migration[7.0]
  def change
    create_table :localities do |t|
      t.string :name
      t.string :province

      t.timestamps
    end
  end
end
