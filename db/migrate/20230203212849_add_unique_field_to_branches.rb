class AddUniqueFieldToBranches < ActiveRecord::Migration[7.0]
  def change
    add_index :bank_branches, :name, unique: true
  end
end
