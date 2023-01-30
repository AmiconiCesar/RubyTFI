class AddUniqueFieldToSchedule < ActiveRecord::Migration[7.0]
  def change
    add_index(:schedules, :weekday, unique: true)
  end
end
