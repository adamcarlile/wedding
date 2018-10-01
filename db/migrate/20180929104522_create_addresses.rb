class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, id: :uuid do |t|
      t.references :addressable, type: :uuid, index: true, null: false, polymorphic: true
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :region
      t.string :country_code
      t.string :postal_code
      t.timestamps
    end
  end
end
