class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.date :date
      t.time :time
      t.string :reason
      t.integer :state
      t.string :comment

      t.timestamps
    end
  end
end
