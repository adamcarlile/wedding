class AddAttendanceToInvitee < ActiveRecord::Migration[5.2]
  def change
    add_column :invitees, :attendance, :boolean, default: false
  end
end
