class CreateCommuncationsQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :communications_questions, id: :uuid do |t|
      t.references :communication, type: :uuid, index: true, null: false
      t.string :prompt
      t.string :css_class
      t.timestamps
    end
  end
end
