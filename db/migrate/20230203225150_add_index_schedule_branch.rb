class AddIndexScheduleBranch < ActiveRecord::Migration[7.0]
  def change
    add_index(:schedules, [:weekday, :bank_branch_id], unique: true)
  end
end
