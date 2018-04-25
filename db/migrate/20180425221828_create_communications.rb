class CreateCommunications < ActiveRecord::Migration[5.2]
  def change
    create_table :communications, id: :uuid do |t|
      t.string :title
      t.text :body
      t.string :followup
      t.timestamps
    end
  end
end
