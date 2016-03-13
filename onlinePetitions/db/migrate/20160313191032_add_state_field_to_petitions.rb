class AddStateFieldToPetitions < ActiveRecord::Migration
  def change
    add_column :petitions, :state, :string
  end
end
