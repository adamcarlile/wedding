class CreateAuthCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :auth_codes, id: :uuid do |t|
      t.references :authable, type: :uuid, polymorphic: :true
      t.string :token, null: false
      t.integer :usage_count, default: 0
      t.datetime :revoked_at
      t.timestamps
    end
  end
end
