class AddBorrowedOnToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :borrowed_on, :date
    add_column :rentals, :returned_on, :date
  end
end
