class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances, id: :uuid do |t|
      t.references :event, type: :uuid, index: true, null: false
      t.references :invitee, type: :uuid, index: true, null: false
      t.string :state
      t.timestamps
    end
  end
end
