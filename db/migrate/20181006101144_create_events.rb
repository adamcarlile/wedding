class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name
      t.string :code, index: { unique: true }
      t.timestamps
    end
  end
end
