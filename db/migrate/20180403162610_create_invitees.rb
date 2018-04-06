class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees, id: :uuid do |t|
      t.references :party, type: :uuid, index: true, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :phone
      t.string :email
      t.timestamps
    end
  end
end
