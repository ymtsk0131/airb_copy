class RenameDateToReservation < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :date, :check_in_date
    add_column :reservations, :check_out_date, :date
  end
end
