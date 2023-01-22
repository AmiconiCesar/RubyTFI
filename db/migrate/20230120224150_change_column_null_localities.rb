class ChangeColumnNullLocalities < ActiveRecord::Migration[7.0]
  def change
    change_column_null :localities, :name, false
    change_column_null :localities, :province, false
  end
end
