class AddReferencesLocalityBranch < ActiveRecord::Migration[7.0]
  def change
    add_reference :bank_branches, :locality, foreign_key: true
    change_column_null :bank_branches, :locality_id, false
  end
end
