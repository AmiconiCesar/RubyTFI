class AddReferencePersonalBankBranch < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :bank_branch, foreign_key: true
  end
end
