class AddReferenceBranchTurn < ActiveRecord::Migration[7.0]
  def change
    add_reference :turns, :bank_branch, foreign_key: true
    change_column_null :turns, :bank_branch_id, false
  end
end
