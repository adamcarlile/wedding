class AddExtraToParty < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :category, :string
    add_column :parties, :priority, :string

    add_index :parties, :category
    add_index :parties, :priority
  end
end
