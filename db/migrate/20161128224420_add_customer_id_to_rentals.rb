class AddCustomerIdToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :customer_id, :integer
  end
end
