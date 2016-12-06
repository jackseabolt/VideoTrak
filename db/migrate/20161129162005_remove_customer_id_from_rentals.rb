class RemoveCustomerIdFromRentals < ActiveRecord::Migration[5.0]
  def change
    remove_column :rentals, :customer_id, :integer
  end
end
