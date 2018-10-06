class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :event, type: :uuid, index: true, null: false
      t.references :invitee, type: :uuid, index: true, null: false
      t.timestamps
    end
  end
end
