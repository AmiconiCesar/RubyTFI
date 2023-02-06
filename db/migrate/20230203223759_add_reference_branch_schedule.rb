class AddReferenceBranchSchedule < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :bank_branch, foreign_key: true, dependent: :destroy
    change_column_null :schedules, :bank_branch_id, false
  end
end
