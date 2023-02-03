class ChangeColumnNullBranches < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bank_branches, :name, false
    change_column_null :bank_branches, :address, false
    change_column_null :bank_branches, :phone, false
  end
end
