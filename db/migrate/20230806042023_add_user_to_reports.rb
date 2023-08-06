class AddUserToReports < ActiveRecord::Migration[7.0]
  def change
    Report.delete_all
    add_reference :reports, :user, null: false, foreign_key: true
  end
end
