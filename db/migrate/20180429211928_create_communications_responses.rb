class CreateCommunicationsResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :communications_responses do |t|
      t.references :party, type: :uuid
      t.references :question, type: :uuid
      t.timestamps
    end
  end
end
