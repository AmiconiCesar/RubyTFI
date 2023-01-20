class AddIndexLocalities < ActiveRecord::Migration[7.0]
  def change
    add_index(:localities, [:name, :province], unique: true)
  end
end
