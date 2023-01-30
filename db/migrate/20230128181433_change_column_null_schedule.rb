class ChangeColumnNullSchedule < ActiveRecord::Migration[7.0]
  def change
    change_column_null :schedules, :weekday, false
    change_column_null :schedules, :start_time, false
    change_column_null :schedules, :end_time, false
  end
end
