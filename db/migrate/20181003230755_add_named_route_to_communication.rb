class AddNamedRouteToCommunication < ActiveRecord::Migration[5.2]
  def change
    add_column :communications, :redirect_route, :string
  end
end
