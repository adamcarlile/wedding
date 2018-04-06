class CreateParties < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :parties, id: :uuid do |t|
      t.string :code, null: false, index: true, unique: true
      t.integer :invitees_count
      t.timestamps
    end
  end
end
