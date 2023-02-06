class ChangeColumnNullTurns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :turns, :date, false
    change_column_null :turns, :time, false
    change_column_null :turns, :reason, false
    change_column_null :turns, :state, false
  end
end
