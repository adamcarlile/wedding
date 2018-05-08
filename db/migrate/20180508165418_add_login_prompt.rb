class AddLoginPrompt < ActiveRecord::Migration[5.2]
  def change
    add_column :communications, :login_prompt, :string
  end
end
