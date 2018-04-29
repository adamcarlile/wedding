class CreateCommunicationsDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :communications_deliveries, id: :uuid do |t|
      t.references :communication, type: :uuid
      t.references :invitee, type: :uuid
      t.string :state
      t.datetime :sent_at
      t.timestamps
    end
  end
end
